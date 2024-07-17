CREATE TABLE detail_license
(
    detail_license_idx INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	detail_license_name VARCHAR(100),
    create_date TIMESTAMP DEFAULT NOW(),
    detail_license_description VARCHAR(255),
    license_idx INT
);

CREATE TABLE exam_log_info
(
	idx INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	event_time TIMESTAMP DEFAULT NOW(),
    ip VARCHAR(50),
    device VARCHAR(100),
    browser_name VARCHAR(50),
    event_type VARCHAR(100),
    event_type_info VARCHAR(255),
    member_id VARCHAR(100)
);

CREATE TABLE license
(
    license_idx INT AUTO_INCREMENT PRIMARY KEY,
	license_name VARCHAR(100) NOT NULL,
    create_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE login_log_info
(
	idx INT AUTO_INCREMENT PRIMARY KEY,
    event_time TIMESTAMP DEFAULT NOW(),
    ip VARCHAR(50),
    device VARCHAR(100),
    browser_name VARCHAR(50),
    member_id VARCHAR(100)
);

CREATE TABLE member
(
	member_id VARCHAR(100) NOT NULL PRIMARY KEY,
    member_password VARCHAR(255) NOT NULL,
    member_name VARCHAR(50) NOT NULL,
    member_phone_number VARCHAR(50) NOT NULL,
    member_nickname VARCHAR(50) NOT NULL,
    member_gender CHAR(1) NOT NULL,
    is_active CHAR(1) NOT NULL DEFAULT '1',
    registration_date TIMESTAMP DEFAULT NOW(),
    update_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE question
(
	question_idx INT AUTO_INCREMENT PRIMARY KEY,
    question_number TINYINT UNSIGNED NOT NULL,
    question TEXT NOT NULL,
    option1 TEXT NOT NULL,
    option2 TEXT NOT NULL,
    option3 TEXT NOT NULL,
    option4 TEXT NOT NULL,
    answer TINYINT UNSIGNED NOT NULL,
    create_date TIMESTAMP DEFAULT NOW(),
    image VARCHAR(255),
    subject_idx int,
    question_description TEXT
);

CREATE TABLE session_question
(
	session_question_idx INT AUTO_INCREMENT PRIMARY KEY,
    exam_date VARCHAR(50) NOT NULL,
    create_date TIMESTAMP DEFAULT NOW(),
    question_idx INT
);

CREATE TABLE subject
(
    subject_idx INT AUTO_INCREMENT PRIMARY KEY,
	subject_name VARCHAR(100) NOT NULL,
    subject_number INT NOT NULL,
    create_date TIMESTAMP DEFAULT NOW(),
    detail_license_idx int
);

CREATE TABLE exam_record
(
	exam_record_idx INT AUTO_INCREMENT PRIMARY KEY,
    mode CHAR(1) NOT NULL,
    remaining_time VARCHAR(50),
    score INT,
    start_test_date VARCHAR(50),
    member_id VARCHAR(100) NOT NULL,
    session_question_idx INT,
    create_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE user_select_answer
(
	user_select_answer_idx INT AUTO_INCREMENT PRIMARY KEY,
    is_correct CHAR(1),
    select_answer INT,
    start_test_date VARCHAR(50),
    member_id VARCHAR(100),
    question_idx int,
    create_date TIMESTAMP DEFAULT NOW()
);

ALTER TABLE detail_license
ADD FOREIGN KEY R_9 (license_idx) REFERENCES license (license_idx);

ALTER TABLE exam_log_info
ADD FOREIGN KEY R_17 (member_id) REFERENCES member (member_id);

ALTER TABLE exam_record
ADD FOREIGN KEY R_20 (member_id) REFERENCES member (member_id);

ALTER TABLE exam_record
ADD FOREIGN KEY R_32 (session_question_idx) REFERENCES session_question (session_question_idx);

ALTER TABLE login_log_info
ADD FOREIGN KEY R_16 (member_id) REFERENCES member (member_id);

ALTER TABLE question
ADD FOREIGN KEY R_22 (subject_idx) REFERENCES subject (subject_idx);

ALTER TABLE session_question
ADD FOREIGN KEY R_26 (question_idx) REFERENCES question (question_idx);

ALTER TABLE subject
ADD FOREIGN KEY R_10 (detail_license_idx) REFERENCES detail_license (detail_license_idx);

ALTER TABLE user_select_answer
ADD FOREIGN KEY R_11 (member_id) REFERENCES member (member_id);

ALTER TABLE user_select_answer
ADD FOREIGN KEY R_30 (question_idx) REFERENCES question (question_idx);