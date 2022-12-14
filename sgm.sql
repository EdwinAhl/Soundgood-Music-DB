CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 ssn VARCHAR(12) NOT NULL,
 name VARCHAR(100) NOT NULL,
 street VARCHAR(100) NOT NULL,
 zip VARCHAR(100) NOT NULL,
 city VARCHAR(100) NOT NULL,
 mail VARCHAR(100) NOT NULL,
 student_id INT
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE phone (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_no VARCHAR(100) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE price (
 difficulty level NOT NULL,
 lesson_type lesson_type NOT NULL,
 base_price INT NOT NULL
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (difficulty,lesson_type);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL,
 skill level,
 instrument_to_learn VARCHAR(100)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL,
 skill level NOT NULL,
 instrument VARCHAR(100) NOT NULL,
 available_from TIMESTAMP(100),
 available_to TIMESTAMP(100)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE lease (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT,
 student_id INT NOT NULL,
 start_day DATE NOT NULL,
 end_day DATE
);

ALTER TABLE lease ADD CONSTRAINT PK_lease PRIMARY KEY (id);


CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT,
 difficulty level NOT NULL,
 lesson_type lesson_type NOT NULL,
 instrument VARCHAR(100) NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE person_phone (
 person_id INT NOT NULL,
 phone_id INT NOT NULL
);

ALTER TABLE person_phone ADD CONSTRAINT PK_person_phone PRIMARY KEY (person_id,phone_id);


CREATE TABLE rentable_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 -- lease_id INT,
 price INT NOT NULL,
 type VARCHAR(100) NOT NULL,
 quality VARCHAR(100) NOT NULL,
 brand VARCHAR(100)
);

ALTER TABLE rentable_instrument ADD CONSTRAINT PK_rentable_instrument PRIMARY KEY (id);


CREATE TABLE sibling_student (
 student_id1 INT NOT NULL,
 student_id2 INT NOT NULL
);

ALTER TABLE sibling_student ADD CONSTRAINT PK_sibling_student PRIMARY KEY (student_id1,student_id2);


CREATE TABLE student_lesson (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE student_lesson ADD CONSTRAINT PK_student_lesson PRIMARY KEY (student_id,lesson_id);


CREATE TABLE group_lesson (
 lesson_id INT NOT NULL,
 min_students INT NOT NULL,
 max_students INT NOT NULL,
 start_time TIMESTAMP(100) NOT NULL,
 end_time TIMESTAMP(100)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE individual_lesson (
 lesson_id INT NOT NULL,
 start_time TIMESTAMP(100) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);


CREATE TABLE ensamble (
 lesson_id INT NOT NULL,
 genre VARCHAR(100)
);

ALTER TABLE ensamble ADD CONSTRAINT PK_ensamble PRIMARY KEY (lesson_id);


ALTER TABLE person ADD CONSTRAINT FK_person_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE lease ADD CONSTRAINT FK_lease_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE lease ADD CONSTRAINT FK_lease_1 FOREIGN KEY (instrument_id) REFERENCES rentable_instrument (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (difficulty,lesson_type) REFERENCES price (difficulty,lesson_type);


ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (id);


-- ALTER TABLE rentable_instrument ADD CONSTRAINT FK_rentable_instrument_0 FOREIGN KEY (lease_id) REFERENCES lease (id);


ALTER TABLE sibling_student ADD CONSTRAINT FK_sibling_student_0 FOREIGN KEY (student_id1) REFERENCES student (id);
ALTER TABLE sibling_student ADD CONSTRAINT FK_sibling_student_1 FOREIGN KEY (student_id2) REFERENCES student (id);


ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE ensamble ADD CONSTRAINT FK_ensamble_0 FOREIGN KEY (lesson_id) REFERENCES group_lesson (lesson_id);


