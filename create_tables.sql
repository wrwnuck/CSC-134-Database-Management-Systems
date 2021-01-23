 CREATE TABLE BUSINESS(
     ID INT NOT NULL,
     name VARCHAR(30) NOT NULL,
     address VARCHAR(40) NOT NULL,
     city VARCHAR(22) NOT NULL,
     state VARCHAR(14) NOT NULL,
     zip INT NOT NULL,
     LATITUDE DECIMAL(7,4) NOT NULL,
     LONGITUDE DECIMAL(7,4) NOT NULL,
     PRIMARY KEY(ID)
     );

CREATE TABLE USER(
     ID INT NOT NULL,
     name VARCHAR(30) DEFAULT NULL,
     date_joined DATE DEFAULT NULL,
     PRIMARY KEY(ID)
     );

CREATE TABLE PHONE(
     bus_id INT NOT NULL,
     phone VARCHAR(11) NOT NULL,
     PRIMARY KEY (bus_id, phone),
     FOREIGN KEY(bus_id) REFERENCES BUSINESS(ID)
     );

CREATE TABLE BUSINESS_CATEGORY(
     bus_id INT NOT NULL,
     category VARCHAR(30) NOT NULL,
     PRIMARY KEY(bus_id, category),
     FOREIGN KEY(bus_id) REFERENCES BUSINESS(ID)
     );

CREATE TABLE REVIEW(
     ID INT NOT NULL,
     bus_id INT DEFAULT NULL,
     user_id INT DEFAULT NULL,
     stars INT DEFAULT,
     text VARCHAR(650) DEFAULT NULL,
     PRIMARY KEY(ID),
     FOREIGN KEY(bus_id) REFERENCES BUSINESS(ID),
     FOREIGN KEY(user_id) REFERENCES USER(ID)
     );

CREATE TABLE CHECK_IN(
     user_id INT NOT NULL,
     bus_id INT NOT NULL,
     cdate DATE NOT NULL,
     PRIMARY KEY(user_id, bus_id, cdate),
     FOREIGN KEY(user_id) REFERENCES USER(ID),
     FOREIGN KEY(bus_id) REFERENCES BUSINESS(ID)
     );

 CREATE TABLE FRIEND(
     user_id1 INT NOT NULL,
     user_id2 INT NOT NULL,
     date_friended DATE DEFAULT NULL,
     PRIMARY KEY(user_id1, user_id2),
     FOREIGN KEY(user_id1) REFERENCES USER(ID),
     FOREIGN KEY(user_id2) REFERENCES USER(ID)
     );

