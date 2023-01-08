-- Insert statements are at the bottom of this file.
use PROJECT3;

-- TRIGGERS AND FUNCTION --
-- Part 1 Trigger
delimiter //
CREATE trigger DEGREE_SIX_CORE_COURSES
    BEFORE INSERT ON DEGREE_COURSE
    for each row
BEGIN
    DECLARE CORE INT;
        SELECT COUNT(*) INTO CORE
        FROM DEGREE_COURSE
        WHERE Type = 'CORE'
        AND Deg_code = new.Deg_code;
    if CORE >= 6 then
        SIGNAL SQLSTATE '45000'
            set message_text = 'Each degree can only have no more than 6 core courses.';
    end if;
END //
delimiter ;

-- Part 2 Trigger
delimiter //
CREATE trigger PREREQ
    BEFORE INSERT ON TRANSCRIPT
    for each row
BEGIN
    DECLARE PRE_NEEDED INT;
    DECLARE PRE_TAKEN INT;

    SELECT COUNT(*) INTO PRE_NEEDED
    FROM PREREQUISITE
    WHERE PREREQUISITE.Course = new.Course_no;

    SELECT COUNT(*) INTO PRE_TAKEN
    FROM TRANSCRIPT
    WHERE TRANSCRIPT.Student_ID = new.Student_ID
    AND TRANSCRIPT.Course_no 
    IN (
        SELECT Prereq
        FROM PREREQUISITE
        WHERE PREREQUISITE.Course = new.Course_no
    );
    
    if PRE_NEEDED <> PRE_TAKEN then
        SIGNAL SQLSTATE '45000'
            set message_text = 'Cannot insert this course because pre-requisite course(s) is not satisfied.';
    end if;
END //
delimiter ;

-- Part 3 Trigger
delimiter //
CREATE trigger STUDENT_TWO_CONC
    BEFORE INSERT ON STUDENT_CONCENTRATION
    for each row
BEGIN
    DECLARE CONC INT;
        SELECT COUNT(*) INTO CONC
        FROM STUDENT_CONCENTRATION
        WHERE Student_ID = new.Student_ID;
    if CONC >= 2 then
        SIGNAL SQLSTATE '45000'
            set message_text = 'Each student can only declare no more than two concentrations.';
    end if;
END //
delimiter ;

-- Part 4 Function
delimiter //
CREATE FUNCTION get_gpa(S_ID VARCHAR(9))
    RETURNS DECIMAL(10,4)
    deterministic
BEGIN
	DECLARE all_processed TINYINT DEFAULT FALSE;
    DECLARE GPA DECIMAL(10,4) DEFAULT 0.0000;
    DECLARE LETTER_GRADE VARCHAR(2) DEFAULT "";
    DECLARE TOTAL DECIMAL(10,4) DEFAULT 0.0000;
    DECLARE NUM_COURSES INT DEFAULT 0;
    DECLARE GRADE_CURSOR CURSOR for
        SELECT Grade
        FROM TRANSCRIPT
        WHERE Student_ID = S_ID;
    DECLARE CONTINUE HANDLER for NOT FOUND
        set all_processed = true;
        
    OPEN GRADE_CURSOR;

        get_grade: loop
            FETCH GRADE_CURSOR INTO LETTER_GRADE;
			if all_processed then
                leave get_grade;
            end if;
            
            if LETTER_GRADE = 'A' then
                set TOTAL = TOTAL + 4.0000;
            elseif LETTER_GRADE = 'A-' then
                set TOTAL = TOTAL + 3.7000;
            elseif LETTER_GRADE = 'B+' then
                set TOTAL = TOTAL + 3.3000;
            elseif LETTER_GRADE = 'B' then
                set TOTAL = TOTAL + 3.0000;
            elseif LETTER_GRADE = 'B-' then
                set TOTAL = TOTAL + 2.7000;
            elseif LETTER_GRADE = 'C+' then
                set TOTAL = TOTAL + 2.3000;
            elseif LETTER_GRADE = 'C' then
                set TOTAL = TOTAL + 2.0000;
            elseif LETTER_GRADE = 'C-' then
                set TOTAL = TOTAL + 1.7000;
			elseif LETTER_GRADE = 'D' then
                set TOTAL = TOTAL + 1.0000;
            elseif LETTER_GRADE = 'F' then
                set TOTAL = TOTAL + 0.0000;
            elseif LETTER_GRADE = '' then
                -- If course has no grade, don't include this course. 
                if NUM_COURSES > 0 then
					set NUM_COURSES = NUM_COURSES - 1;
				else
					set NUM_COURSES = 0;
				end if;
			else
				set TOTAL = TOTAL + 0.0000;
            end if;
			
            set NUM_COURSES = NUM_COURSES + 1;
            set GPA = TOTAL / NUM_COURSES;
        end loop get_grade;

    close GRADE_CURSOR;

    return GPA;
    END //
delimiter ;

-- INSERT STATEMENTS --
-- First statement of Part 1 to Part 3 should work; Second statement should fail.
-- Part 1 Insert Statements
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 699', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 701', 'CORE'); 

-- Part 2 Insert Statements
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 544', 'SPRING', '2014', '');
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 690', 'SPRING', '2014', ''); 

-- Part 3 Insert Statements
INSERT INTO STUDENT_CONCENTRATION VALUES('U12345678', 'MS CIS CN');
INSERT INTO STUDENT_CONCENTRATION VALUES('U12345678', 'MS CIS DA'); 

-- Part 4 Function Call
SELECT get_gpa('U12345678');