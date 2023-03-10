CREATE SCHEMA PROJECT3;

USE PROJECT3;

CREATE TABLE COURSE
(
    Course_no       VARCHAR(10)     NOT NULL,
    Course_name     VARCHAR(100)    NOT NULL,
    Description     VARCHAR(600)    NOT NULL,
    PRIMARY KEY(Course_no)
);

CREATE TABLE DEGREE
(
    Deg_code        VARCHAR(6)      NOT NULL,
    Deg_name        VARCHAR(100)    NOT NULL,
    Description     VARCHAR(600)    NOT NULL,
    PRIMARY KEY(Deg_code)
);

CREATE TABLE STUDENT
(
    Student_ID      VARCHAR(9)      NOT NULL,
    FName           VARCHAR(50)     NOT NULL,
    LName           VARCHAR(50)     NOT NULL,
    Deg_code        VARCHAR(6),
    PRIMARY KEY(Student_ID),
    FOREIGN KEY(Deg_code) REFERENCES DEGREE(Deg_code)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE TRANSCRIPT
(
    Student_ID      VARCHAR(9)      NOT NULL,
    Course_no       VARCHAR(10)     NOT NULL,
    Semester        VARCHAR(6)      NOT NULL,
    Year            INTEGER         NOT NULL,
    Grade           VARCHAR(2),
    PRIMARY KEY(Student_ID, Course_no, Semester, Year),
    FOREIGN KEY(Student_ID) REFERENCES STUDENT(Student_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Course_no) REFERENCES COURSE(Course_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE CONCENTRATION
(
    Conc_code       VARCHAR(10)     NOT NULL,
    Conc_name       VARCHAR(100)    NOT NULL,
    Description     VARCHAR(600)    NOT NULL,
    Deg_code        VARCHAR(6)      NOT NULL,
    PRIMARY KEY(Conc_code),
    FOREIGN KEY(Deg_code) REFERENCES DEGREE(Deg_code)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE STUDENT_CONCENTRATION
(
    Student_ID      VARCHAR(9)      NOT NULL,
    Conc_code       VARCHAR(10)     NOT NULL,
    PRIMARY KEY(Student_ID, Conc_code),
    FOREIGN KEY(Student_ID) REFERENCES STUDENT(Student_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Conc_code) REFERENCES CONCENTRATION(Conc_code)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE PREREQUISITE
(
    Course          VARCHAR(10)     NOT NULL,
    Prereq          VARCHAR(10)     NOT NULL,
    PRIMARY KEY(Course, Prereq),
    FOREIGN KEY(Course) REFERENCES COURSE(Course_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Prereq) REFERENCES COURSE(Course_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE CONCENTRATION_COURSE
(
    Conc_code       VARCHAR(10)     NOT NULL,
    Course_no       VARCHAR(10)     NOT NULL,
    Type            VARCHAR(8)      NOT NULL,
    PRIMARY KEY(Conc_code, Course_no),
    FOREIGN KEY(Conc_code) REFERENCES CONCENTRATION(Conc_code)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Course_no) REFERENCES COURSE(Course_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE DEGREE_COURSE
(
    Deg_code        VARCHAR(6)      NOT NULL,
    Course_no       VARCHAR(10)     NOT NULL,
    Type            VARCHAR(8)      NOT NULL,
    PRIMARY KEY(Deg_code, Course_no),
    FOREIGN KEY(Deg_code) REFERENCES DEGREE(Deg_code)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(Course_no) REFERENCES COURSE(Course_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Task 3
-- Degree
INSERT INTO DEGREE VALUES('MS ADA', 'Applied Data Analytics', 'Applied Data Analytics Description');
INSERT INTO DEGREE VALUES('MS CS', 'Computer Science', 'Computer Science Description');
INSERT INTO DEGREE VALUES('MS CIS', 'Computer Information Systems', 'Computer Information Systems Description');
INSERT INTO DEGREE VALUES('MS SD', 'Software Development', 'Software Development Description');

-- Concentration
INSERT INTO CONCENTRATION VALUES('MS CS CN', 'Computer Networks', 'Computer Networks Description', 'MS CS');
INSERT INTO CONCENTRATION VALUES('MS CS DA', 'Data Analytics', 'Data Analytics Description', 'MS CS');
INSERT INTO CONCENTRATION VALUES('MS CS S', 'Security', 'Security Description', 'MS CS');
INSERT INTO CONCENTRATION VALUES('MS CIS CN', 'Computer Networks', 'Computer Networks Description', 'MS CIS');
INSERT INTO CONCENTRATION VALUES('MS CIS DA', 'Data Analytics', 'Data Analytics Description', 'MS CIS');
INSERT INTO CONCENTRATION VALUES('MS CIS DM', 'Database Management & Business Intelligence', 'Database Management & Business Intelligence Description', 'MS CIS');
INSERT INTO CONCENTRATION VALUES('MS CIS HI', 'Health Informatics', 'Health Informatics Description', 'MS CIS');
INSERT INTO CONCENTRATION VALUES('MS CIS IT', 'IT Project Management', 'IT Project Management Description', 'MS CIS');
INSERT INTO CONCENTRATION VALUES('MS CIS S', 'Security', 'Security Description', 'MS CIS');
INSERT INTO CONCENTRATION VALUES('MS CIS WA', 'Web Application Development', 'Web Application Development Description', 'MS CIS');

-- Course
INSERT INTO COURSE VALUES('MET CS 520', 'Information Structures with Java', '520 Description');
INSERT INTO COURSE VALUES('MET CS 521', 'Information Structures with Python', '521 Description');
INSERT INTO COURSE VALUES('MET CS 526', 'Data Structures and Algorithms', '526 Description');
INSERT INTO COURSE VALUES('MET CS 532', 'Computer Graphics', '532 Description');
INSERT INTO COURSE VALUES('MET CS 535', 'Computer Networks', '535 Description');
INSERT INTO COURSE VALUES('MET CS 544', 'Foundations of Analytics and Data Visualization', '544 Description');
INSERT INTO COURSE VALUES('MET CS 546', 'Introduction to Probability and Statistics', '546 Description');
INSERT INTO COURSE VALUES('MET CS 555', 'Foundations of Machine Learning', '555 Description');
INSERT INTO COURSE VALUES('MET CS 561', 'Financial Informatics', '561 Description');
INSERT INTO COURSE VALUES('MET CS 566', 'Analysis of Algorithms', '566 Description');
INSERT INTO COURSE VALUES('MET CS 570', 'Biomedical Sciences and Health IT', '570 Description');
INSERT INTO COURSE VALUES('MET CS 575', 'Operating Systems', '575 Description');
INSERT INTO COURSE VALUES('MET CS 579', 'Database Management', '579 Description');
INSERT INTO COURSE VALUES('MET CS 580', 'Health Informatics', '580 Description');
INSERT INTO COURSE VALUES('MET CS 581', 'Health Information Systems', '581 Description');
INSERT INTO COURSE VALUES('MET MA 582', 'Mathematical Statistics', '582 Description');
INSERT INTO COURSE VALUES('MET CS 599', 'Biometrics', '599 Description');
INSERT INTO COURSE VALUES('MET CS 601', 'Web Application Development', '601 Description');
INSERT INTO COURSE VALUES('MET CS 602', 'Server-Side Web Development', '602 Description');
INSERT INTO COURSE VALUES('MET CS 622', 'Advanced Programming Techniques', '622 Description');
INSERT INTO COURSE VALUES('MET CS 625', 'Business Data Communication and Networks', '625 Description');
INSERT INTO COURSE VALUES('MET CS 632', 'Information Technology Project Management', '632 Description');
INSERT INTO COURSE VALUES('MET CS 633', 'Software Quality, Testing, and Security Management', '633 Description');
INSERT INTO COURSE VALUES('MET CS 634', 'Agile Software Development', '634 Description');
INSERT INTO COURSE VALUES('MET CS 635', 'Network Media Technologies', '635 Description');
INSERT INTO COURSE VALUES('MET CS 662', 'Computer Language Theory', '662 Description');
INSERT INTO COURSE VALUES('MET CS 664', 'Artificial Intelligence', '664 Description');
INSERT INTO COURSE VALUES('MET CS 665', 'Software Design and Patterns', '665 Description');
INSERT INTO COURSE VALUES('MET CS 669', 'Database Design and Implementation for Business', '669 Description');
INSERT INTO COURSE VALUES('MET CS 673', 'Software Engineering', '673 Description');
INSERT INTO COURSE VALUES('MET CS 674', 'Database Security', '674 Description');
INSERT INTO COURSE VALUES('MET CS 677', 'Data Science with Python', '677 Description');
INSERT INTO COURSE VALUES('MET CS 682', 'Information Systems Analysis and Design', '682 Description');
INSERT INTO COURSE VALUES('MET CS 683', 'Mobile Application Development with Android', '683 Description');
INSERT INTO COURSE VALUES('MET CS 684', 'Enterprise Cybersecurity Management', '684 Description');
INSERT INTO COURSE VALUES('MET CS 685', 'Network Design and Management', '685 Description');
INSERT INTO COURSE VALUES('MET CS 688', 'Web Mining and Graph Analytics', '688 Description');
INSERT INTO COURSE VALUES('MET CS 689', 'Designing and Implementing a Data Warehouse', '689 Description');
INSERT INTO COURSE VALUES('MET CS 690', 'Network Security', '690 Description');
INSERT INTO COURSE VALUES('MET CS 693', 'Digital Forensics and Investigations', '693 Description');
INSERT INTO COURSE VALUES('MET CS 694', 'Mobile Forensics and Security', '694 Description');
INSERT INTO COURSE VALUES('MET CS 695', 'Cybersecurity', '695 Description');
INSERT INTO COURSE VALUES('MET CS 699', 'Data Mining', '699 Description');
INSERT INTO COURSE VALUES('MET CS 701', 'Rich Internet Application Development', '701 Description');
INSERT INTO COURSE VALUES('MET CS 703', 'Network Forensics', '703 Description');
INSERT INTO COURSE VALUES('MET CS 763', 'Secure Software Development', '763 Description');
INSERT INTO COURSE VALUES('MET CS 767', 'Advanced Machine Learning and Neural Networks', '767 Description');
INSERT INTO COURSE VALUES('MET CS 775', 'Advanced Networking', '775 Description');
INSERT INTO COURSE VALUES('MET CS 777', 'Big Data Analytics', '777 Description');
INSERT INTO COURSE VALUES('MET CS 779', 'Advanced Database Management', '779 Description');
INSERT INTO COURSE VALUES('MET CS 781', 'Advanced Health Informatics', '781 Description');
INSERT INTO COURSE VALUES('MET CS 782', 'IT Strategy and Management', '782 Description');
INSERT INTO COURSE VALUES('MET CS 783', 'Enterprise Architecture', '783 Description');
INSERT INTO COURSE VALUES('MET CS 789', 'Cryptography', '789 Description');
INSERT INTO COURSE VALUES('MET CS 793', 'Special Topics in Computer Science', '793 Description');
INSERT INTO COURSE VALUES('MET CS 799', 'Advanced Cryptography', '799 Description');

-- Prerequisite
INSERT INTO PREREQUISITE VALUES('MET CS 544', 'MET CS 546');
INSERT INTO PREREQUISITE VALUES('MET CS 699', 'MET CS 546');
INSERT INTO PREREQUISITE VALUES('MET CS 535', 'MET CS 575');
INSERT INTO PREREQUISITE VALUES('MET CS 690', 'MET CS 535');
INSERT INTO PREREQUISITE VALUES('MET CS 695', 'MET CS 625');
INSERT INTO PREREQUISITE VALUES('MET CS 674', 'MET CS 579');
INSERT INTO PREREQUISITE VALUES('MET CS 703', 'MET CS 625');
INSERT INTO PREREQUISITE VALUES('MET CS 799', 'MET CS 789');
INSERT INTO PREREQUISITE VALUES('MET CS 555', 'MET CS 544');
INSERT INTO PREREQUISITE VALUES('MET CS 602', 'MET CS 601');

-- Degree_Course
-- MS ADA
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 544', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 555', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 566', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 677', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 688', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 689', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 767', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 777', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET CS 779', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS ADA', 'MET MA 582', 'ELECTIVE');
-- MS CS
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 566', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 575', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 662', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 673', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 535', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 579', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 532', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 544', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 555', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 561', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 570', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 580', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 581', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 599', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 601', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 602', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 622', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 632', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 633', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 635', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 664', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 665', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 674', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 677', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 683', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 684', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 685', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 688', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 689', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 690', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 693', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 694', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 695', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 699', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 701', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 703', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 763', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 767', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 775', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 777', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 779', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 781', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 783', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 789', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 793', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CS', 'MET CS 799', 'ELECTIVE');
-- MS CIS
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 625', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 669', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 682', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 782', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 520', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 521', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 526', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 532', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 544', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 555', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 561', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 570', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 580', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 581', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 599', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 601', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 602', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 622', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 632', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 633', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 634', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 635', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 664', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 665', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 674', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 677', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 683', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 684', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 685', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 688', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 689', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 690', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 693', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 694', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 695', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 699', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 701', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 703', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 763', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 775', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 777', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 779', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 781', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 783', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 789', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 793', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS CIS', 'MET CS 799', 'ELECTIVE');
-- MS SD
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 521', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 526', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 622', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 665', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 673', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 682', 'CORE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 601', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 602', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 633', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 634', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 664', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 669', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 677', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 683', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 701', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 763', 'ELECTIVE');
INSERT INTO DEGREE_COURSE VALUES('MS SD', 'MET CS 767', 'ELECTIVE');

-- Concentration_Course
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 625', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 669', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 682', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 782', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 520', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 521', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 546', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 601', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 602', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 701', 'CORE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 526', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 532', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 544', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 555', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 561', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 570', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 580', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 581', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 599', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 632', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 633', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 634', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 635', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 664', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 665', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 674', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 677', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 683', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 684', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 685', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 688', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 689', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 690', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 693', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 694', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 695', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 699', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 703', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 763', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 775', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 777', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 779', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 781', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 783', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 789', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 793', 'ELECTIVE');
INSERT INTO CONCENTRATION_COURSE VALUES('MS CIS WA', 'MET CS 799', 'ELECTIVE');

-- Student
INSERT INTO STUDENT VALUES('U12345678', 'John', 'Smith', 'MS CIS');
INSERT INTO STUDENT VALUES('U26241438', 'Yuanyi', 'Wang', 'MS CS');
-- Student_Concentration
INSERT INTO STUDENT_CONCENTRATION VALUES('U12345678', 'MS CIS WA');
INSERT INTO STUDENT_CONCENTRATION VALUES('U26241438', 'MS CS DA');

-- Transcript
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 546', 'SPRING', '2014', 'A-');
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 669', 'SPRING', '2014', 'B+');
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 682', 'SPRING', '2014', 'A');
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 782', 'SPRING', '2014', 'B-');
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 520', 'FALL', '2014', 'A-');
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 625', 'FALL', '2014', 'A');
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 601', 'FALL', '2014', 'C+');
INSERT INTO TRANSCRIPT VALUES('U12345678', 'MET CS 602', 'FALL', '2014', 'B');
INSERT INTO TRANSCRIPT VALUES('U26241438', 'MET CS 566', 'FALL', '2021', 'A-');
INSERT INTO TRANSCRIPT VALUES('U26241438', 'MET CS 575', 'FALL', '2021', 'A');
INSERT INTO TRANSCRIPT VALUES('U26241438', 'MET CS 683', 'FALL', '2021', 'A');
INSERT INTO TRANSCRIPT VALUES('U26241438', 'MET CS 555', 'SPRING', '2022', 'A');
INSERT INTO TRANSCRIPT VALUES('U26241438', 'MET CS 579', 'SPRING', '2022', '');
INSERT INTO TRANSCRIPT VALUES('U26241438', 'MET CS 662', 'SPRING', '2022', '');
INSERT INTO TRANSCRIPT VALUES('U26241438', 'MET CS 673', 'SPRING', '2022', '');

-- Task 4
-- (1)
SELECT TRANSCRIPT.Course_no, Course_name, Grade
FROM COURSE, TRANSCRIPT, STUDENT
WHERE TRANSCRIPT.Student_ID = STUDENT.Student_ID
AND TRANSCRIPT.Course_no = COURSE.Course_no
AND STUDENT.FName = 'John'
AND STUDENT.LName = 'Smith'
AND TRANSCRIPT.Semester = 'SPRING'
AND TRANSCRIPT.Year = '2014';

-- (2)
SELECT Conc_name
FROM CONCENTRATION, DEGREE
WHERE CONCENTRATION.Deg_code = DEGREE.Deg_code
AND DEGREE.Deg_code = 'MS CS';

-- (3)
SELECT Course_no, Course_name
FROM PREREQUISITE, COURSE
WHERE PREREQUISITE.Course = COURSE.Course_no
AND PREREQUISITE.Prereq = 'MET CS 546';

-- (4)
SELECT COURSE.Course_no, Course_name, Type
FROM COURSE, CONCENTRATION, CONCENTRATION_COURSE
WHERE COURSE.Course_no = CONCENTRATION_COURSE.Course_no
AND CONCENTRATION.Conc_code = CONCENTRATION_COURSE.Conc_code
AND CONCENTRATION.Conc_name = 'Web Application Development'
ORDER BY Type;