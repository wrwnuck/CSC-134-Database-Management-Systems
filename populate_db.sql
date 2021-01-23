INSERT INTO BUSINESS (ID, name, address, city, state, zip, latitude, longitude) 
	VALUES (3, 'Research', '1234 Dream Street', 'Bigcity', 'California', 55555, 134.2345, 29.2221);

INSERT INTO BUSINESS_CATEGORY(bus_id, category) VALUES (3, 'Conventional Supermarket');

INSERT INTO PHONE(bus_id, phone) VALUES (3, 1234567890);

INSERT INTO USER(ID, name, date_joined) VALUES (123, 'Beep Bop', '2009-01-19');

INSERT INTO CHECK_IN(user_id, bus_id, cdate) VALUES (123, 3, '2009-01-21');

INSERT INTO USER(ID, name, date_joined) VALUES (345, 'Jeffrey Bobo', '2012-02-29');

INSERT INTO USER(ID, name, date_joined) VALUES (234, 'Meep Mop', '2002-05-13');

INSERT INTO FRIEND(user_id1, user_id2, date_friended) VALUES (123, 345, '2019-03-30');

INSERT INTO REVIEW(ID, bus_id, user_id, stars, text) VALUES (56789, 3, 345, 4, 'Food too cold but delicious');

UPDATE REVIEW SET ID = 123456, bus_id = 3, user_id = 345, stars = 1, text = 'bad';

DELETE FROM USER WHERE ID=234;





