-- PART 1

-- CREATES VIEW BUSINESS_VIEW
-- holds all attributes of business and review count as review_count and average stars as average_stars

CREATE VIEW BUSINESS_VIEW
	AS SELECT BUSINESS.id, name, address, city, state, zip, latitude, longitude, COUNT(REVIEW.id) AS 'review_count', AVG(stars) AS 'average_stars'
	FROM BUSINESS, REVIEW
	WHERE BUSINESS.id = REVIEW.bus_id;

-- CREATES VIEW USER_VIEW
-- holds all attributes of user and review count as review_count and average stars as average_stars

CREATE VIEW USER_VIEW
	AS SELECT USER.id, name, date_joined, COUNT(REVIEW.id) AS review_count, AVG(stars) AS average_stars
	FROM USER INNER JOIN REVIEW
	ON USER.id = REVIEW.user_id
	GROUP BY USER.id;


-- PART 2

-- INSERT VALUES INTO BUSINESS TABLE

INSERT INTO BUSINESS (id, name, address, city, state, zip, latitude, longitude) VALUES (100, 'Bark', '123 J STREET', 'S City', 'CA', 1234, 123.45, 123.46);
INSERT INTO BUSINESS (id, name, address, city, state, zip, latitude, longitude) VALUES (101, 'Woof', '124 J STREET', 'L City', 'CA', 1235, 123.47, 123.48);
INSERT INTO BUSINESS (id, name, address, city, state, zip, latitude, longitude) VALUES (102, 'Dog', '125 J STREET', 'M City', 'WA', 1236, 123.49, 123.40);
INSERT INTO BUSINESS (id, name, address, city, state, zip, latitude, longitude) VALUES (103, 'Bob', '126 J STREET', 'T City', 'TX', 1237, 123.10, 123.11);
INSERT INTO BUSINESS (id, name, address, city, state, zip, latitude, longitude) VALUES (104, 'John', 127 J STREET', 'P City', 'MA', 1238, 123.12, 123.13);

-- INSERT VALUES INTO BUSINESS_CATEGORY

INSERT INTO BUSINESS_CATEGORY (bus_id, category) VALUES (101, 'research');
INSERT INTO BUSINESS_CATEGORY (bus_id, category) VALUES (104, 'accounting');
INSERT INTO BUSINESS_CATEGORY (bus_id, category) VALUES (100, 'human resources');
INSERT INTO BUSINESS_CATEGORY (bus_id, category) VALUES (102, 'sales');
INSERT INTO BUSINESS_CATEGORY (bus_id, category) VALUES (103, 'sales');

-- INSERT VALUES INTO USER

INSERT INTO USER (id, name, date_joined) VALUES (1001, 'Steve Jeff', '2005-01-15');
INSERT INTO USER (id, name, date_joined) VALUES (1002, 'Jeff Meep', '2007-04-17');
INSERT INTO USER (id, name, date_joined) VALUES (1003, 'Mark Wang', '1998-02-14');

-- INSERT VALUES INTO CHECK_IN

INSERT INTO CHECK_IN (user_id, bus_id, cdate) VALUES (1002, 101, '2008-01-01');
INSERT INTO CHECK_IN (user_id, bus_id, cdate) VALUES (1003, 102, '2009-03-10');
INSERT INTO CHECK_IN (user_id, bus_id, cdate) VALUES (1001, 100, '2019-02-14');

-- INSERT VALUES INTO PHONE

INSERT INTO PHONE (bus_id, phone) VALUES (100, '8185555555');
INSERT INTO PHONE (bus_id, phone) VALUES (101, '9162222222');
INSERT INTO PHONE (bus_id, phone) VALUES (104, '9994440000');

-- INSERT VALUES INTO REVIEW

INSERT INTO REVIEW (id, bus_id, user_id, stars, rev_text) VALUES (9999, 100, 1001, 1, 'It is not that great');
INSERT INTO REVIEW (id, bus_id, user_id, stars, rev_text) VALUES (9998, 100, 1002, 4, 'It was ok');
INSERT INTO REVIEW (id, bus_id, user_id, stars, rev_text) VALUES (9997, 101, 1003, 2, 'I survived');
INSERT INTO REVIEW (id, bus_id, user_id, stars, rev_text) VALUES (9996, 103, 1001, 3, 'Yes');
INSERT INTO REVIEW (id, bus_id, user_id, stars, rev_text) VALUES (9995, 104, 1002, 5, 'It was good');
INSERT INTO REVIEW (id, bus_id, user_id, stars, rev_text) VALUES (9994, 102, 1003, 2, 'No one likes it');

-- INSERT VALUES INTO FRIEND

INSERT INTO FRIEND (user_id1, user_id2, date_friended) VALUES (1001, 1002, '2011-02-01');
INSERT INTO FRIEND (user_id1, user_id2, date_friended) VALUES (1002, 1003, '2004-02-01');
INSERT INTO FRIEND (user_id1, user_id2, date_friended) VALUES (1003, 1001, '2019-07-09');


-- PART 3

-- 1. SELECTS the Business name and id when the category is restaurnat and cdate is 2019-02-14

SELECT BUSINESS.name, BUSINESS.id
FROM BUSINESS JOIN CHECK_IN ON BUSINESS.id = CHECK_IN.bus_id
              JOIN BUSINESS_CATEGORY ON BUSINESS.id = BUSINESS_CATEGORY.bus_id
WHERE BUSINESS_CATEGORY.category = 'restaurant' AND cdate = '2019-02-14';

-- 2. SELECTS id, name, address, city, state, and zip from businesses who don't have a phone on database

SELECT id, name, address, city, state, zip
FROM BUSINESS LEFT OUTER JOIN PHONE
ON id = bus_id
WHERE phone IS NULL;

-- 3. SELECT name and date_joined from users who friended someone before their join date or friends that befrended someone before their join date

SELECT name, date_joined
FROM USER INNER JOIN FRIEND ON id = user_id1
          INNER JOIN CHECK_IN ON id = user_id
WHERE date_friended < date_joined OR cdate < date_joined;

-- 4. SELECT AND ORDERS zip code in ascending order and shows how many reviews per business

SELECT zip, COUNT(BUSINESS.id) AS review_count
FROM BUSINESS INNER JOIN REVIEW ON BUSINESS.id = REVIEW.bus_id
GROUP BY zip
ORDER BY zip ASC;


-- PART 4 DROP ALL TABLES AND VIEWS

DROP TABLE PHONE;
DROP TABLE BUSINESS_CATEGORY;
DROP TABLE CHECK_IN;
DROP TABLE REVIEW;
DROP TABLE FRIEND;
DROP TABLE USER;
DROP TABLE BUSINESS;
DROP VIEW IF EXISTS USER_VIEW;
DROP VIEW IF EXISTS BUSINESS_VIEW;


