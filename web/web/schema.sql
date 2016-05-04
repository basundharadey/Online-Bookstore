CREATE TABLE members
(
    username VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(100) NOT NULL,
    first_name VARCHAR2(100),
    middle_name VARCHAR2(100),
    last_name VARCHAR2(100),
    dob DATE,
    gender VARCHAR2(6) DEFAULT 'male' CHECK(gender IN('male', 'female')),
    street VARCHAR2(200),
    house_number VARCHAR2(100),
    postal_code VARCHAR2(20),
    city VARCHAR2(100),
    country VARCHAR2(100),
    email VARCHAR2(255),
    phone_number VARCHAR2(20)
);

insert into members (username, password) values('administrator', 'imdeva');
insert into members (username, password) values('admin', 'imdeva');

CREATE TABLE authors
(
    id NUMBER PRIMARY KEY,
    author VARCHAR2(255) UNIQUE
);

insert into authors values('1', '');

CREATE TABLE publishers
(
    id NUMBER PRIMARY KEY,
    publisher VARCHAR2(255) NOT NULL UNIQUE
);

CREATE TABLE categories
(
    id NUMBER PRIMARY KEY,
    category VARCHAR2(255) NOT NULL UNIQUE
);

CREATE TABLE category_tags
(
    id NUMBER PRIMARY KEY,
    category NUMBER REFERENCES categories(id) ON DELETE CASCADE,
    tag VARCHAR2(100) NOT NULL
);

CREATE TABLE books
(
    ISBN CHAR(13) PRIMARY KEY,
    title VARCHAR2(255) NOT NULL,
    author1 NUMBER REFERENCES authors(id) ON DELETE CASCADE,
    author2 NUMBER DEFAULT '1' REFERENCES authors(id) ON DELETE CASCADE,
    author3 NUMBER DEFAULT '1' REFERENCES authors(id) ON DELETE CASCADE,
    author4 NUMBER DEFAULT '1' REFERENCES authors(id) ON DELETE CASCADE,
    author5 NUMBER DEFAULT '1' REFERENCES authors(id) ON DELETE CASCADE,
    publisher NUMBER REFERENCES publishers(id) ON DELETE CASCADE,
    selling_price FLOAT NOT NULL,
    discount_offered FLOAT DEFAULT '0' NOT NULL,
    publication_year CHAR(4) NOT NULL,
    edition NUMBER(2) NOT NULL,
    volume NUMBER(2) NOT NULL,
    book_type VARCHAR2(10) DEFAULT 'paperback' CHECK(book_type IN('hardbound','paperback')),
    quantity NUMBER NOT NULL,
    description VARCHAR2(4000),
    toc VARCHAR2(255),
    sample_chap VARCHAR2(255)
);

CREATE TABLE book_tags
(
    id NUMBER PRIMARY KEY,
    ISBN CHAR(13) REFERENCES books(ISBN) ON DELETE CASCADE,
    tag VARCHAR2(100) NOT NULL
);

CREATE TABLE book_categories
(
    id NUMBER PRIMARY KEY,
    ISBN CHAR(13) REFERENCES books(ISBN) ON DELETE CASCADE,
    category NUMBER REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE sales
(
    id NUMBER PRIMARY KEY,
    ISBN CHAR(13) REFERENCES books(ISBN) ON DELETE CASCADE,
    sales_price FLOAT NOT NULL,
    member VARCHAR2(32) REFERENCES members(username) ON DELETE CASCADE,
    sales_date DATE NOT NULL,
    quantity NUMBER NOT NULL
);





CREATE SEQUENCE authors_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE publishers_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE categories_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE category_tags_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE book_tags_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE book_categories_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE sales_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;





CREATE OR REPLACE TRIGGER authors_trigger
BEFORE INSERT ON authors
FOR EACH ROW
BEGIN
SELECT authors_seq.nextval INTO :new.id FROM dual;
END;
/

CREATE OR REPLACE TRIGGER publishers_trigger
BEFORE INSERT ON publishers
FOR EACH ROW
BEGIN
SELECT publishers_seq.nextval INTO :new.id FROM dual;
END;
/

CREATE OR REPLACE TRIGGER categories_trigger
BEFORE INSERT ON categories
FOR EACH ROW
BEGIN
SELECT categories_seq.nextval INTO :new.id FROM dual;
END;
/

CREATE OR REPLACE TRIGGER category_tags_trigger
BEFORE INSERT ON category_tags
FOR EACH ROW
BEGIN
SELECT category_tags_seq.nextval INTO :new.id FROM dual;
END;
/

CREATE OR REPLACE TRIGGER book_tags_trigger
BEFORE INSERT ON book_tags
FOR EACH ROW
BEGIN
SELECT book_tags_seq.nextval INTO :new.id FROM dual;
END;
/

CREATE OR REPLACE TRIGGER book_categories_trigger
BEFORE INSERT ON book_categories
FOR EACH ROW
BEGIN
SELECT book_categories_seq.nextval INTO :new.id FROM dual;
END;
/

CREATE OR REPLACE TRIGGER sales_trigger
BEFORE INSERT ON sales
FOR EACH ROW
BEGIN
SELECT sales_seq.nextval INTO :new.id FROM dual;
END;
/
