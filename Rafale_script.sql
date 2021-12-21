-- // AIRLINES RESERVATION PROJECT - RAFALE //

/* can use an existing db user or create a new one using below commands
    CREATE USER rafale IDENTIFIED by rafale;
    GRANT ALL PRIVILEGES TO rafale;
*/

/*  Tables -
    1. FLIGHTS
    2. ROUTES
    3. SCHEDULE
    4. FLIGHT_SCHEDULE
    5. USERS
    6. ADMIN
    7. SEATS
    8. BOOKING
    9. PASSENGERS
*/

-- FLIGHTS table with each Airline having its own unique ID
-- Admin will use this ID to refer to respective Airline while Adding Flight

CREATE TABLE FLIGHTS (
    id NUMBER(4) PRIMARY KEY,
    airlines VARCHAR2(20) NOT NULL,
    max_seats NUMBER(3),
    max_baggage_kg NUMBER(2),
    economy DOUBLE PRECISION NOT NULL,
    business DOUBLE PRECISION
);

INSERT INTO FLIGHTS VALUES(001, 'Air India', 50, 21, 3000, 5000);
INSERT INTO FLIGHTS VALUES(002, 'Indigo', 40, 20, 3000, 4500);
INSERT INTO FLIGHTS VALUES(003, 'Air India', 50, 21, 3000, 5000);
INSERT INTO FLIGHTS VALUES(004, 'Vistara', 50, 15, 4000, 6000);
INSERT INTO FLIGHTS VALUES(005, 'Go Air', 30, 15, 3500, 5000);
INSERT INTO FLIGHTS VALUES(006, 'Vistara', 25, 14, 4000, 6000);
INSERT INTO FLIGHTS VALUES(007, 'Go Air', 5, 7, 3500, 5000);
INSERT INTO FLIGHTS VALUES(008, 'Indigo', 30, 15, 3000, 4500);
INSERT INTO FLIGHTS VALUES(009, 'Indigo', 40, 15, 3000, 4500);
INSERT INTO FLIGHTS VALUES(010, 'Air India', 35, 15, 3000, 5000);


-- ROUTES table with each route having its own unique ID

CREATE TABLE ROUTES(
    id NUMBER(4) PRIMARY KEY,
    source VARCHAR2(20) NOT NULL,
    destination VARCHAR2(20) NOT NULL
);

INSERT INTO ROUTES VALUES(101, 'Delhi', 'Mumbai');
INSERT INTO ROUTES VALUES(102, 'Mumbai', 'Delhi');
INSERT INTO ROUTES VALUES(103, 'Delhi', 'Pune');
INSERT INTO ROUTES VALUES(104, 'Pune', 'Delhi');
INSERT INTO ROUTES VALUES(105, 'Bangalore', 'Chennai');
INSERT INTO ROUTES VALUES(106, 'Chennai', 'Bangalore');
INSERT INTO ROUTES VALUES(107, 'Chennai', 'Mumbai');
INSERT INTO ROUTES VALUES(108, 'Mumbai', 'Chennai');
INSERT INTO ROUTES VALUES(109, 'Mumbai', 'Bangalore');
INSERT INTO ROUTES VALUES(110, 'Bangalore', 'Mumbai');
INSERT INTO ROUTES VALUES(111, 'Delhi', 'Chennai');
INSERT INTO ROUTES VALUES(112, 'Chennai', 'Delhi');
INSERT INTO ROUTES VALUES(113, 'Pune', 'Bangalore');
INSERT INTO ROUTES VALUES(114, 'Bangalore', 'Pune');

-- Creating SEQUENCES

create sequence schedule_seq start with 100 increment by 1;
create sequence fschedule_seq start with 200 increment by 1;
create sequence user_seq start with 300 increment by 1;
create sequence seats_seq start with 10 increment by 1;
create sequence booking_seq start with 401 increment by 1;
create sequence passenger_seq start with 501 increment by 1;


-- SCHEDULE table with each route having multiple depart/arrive schedules

CREATE TABLE SCHEDULE(
    id NUMBER(4) PRIMARY KEY,
    route_id NUMBER(4),
    depart TIMESTAMP NOT NULL,
    arrive TIMESTAMP NOT NULL,
    CONSTRAINT route_fk FOREIGN KEY (route_id) REFERENCES ROUTES(id)
);


-- FLIGHT_SCHEDULE table with each row corresponding to a unique schedule and flight pair

CREATE TABLE FLIGHT_SCHEDULE(
    id NUMBER(4) PRIMARY KEY,
    schedule_id NUMBER(4),
    flight_id NUMBER(4),
    economy DOUBLE PRECISION NOT NULL,
    business DOUBLE PRECISION,
    eco_seats_available NUMBER(2),
    bus_seats_available NUMBER(2),
    status VARCHAR2(20) DEFAULT 'AVAILABLE',
    CONSTRAINT f_fk FOREIGN KEY (flight_id) REFERENCES FLIGHTS(id),
    CONSTRAINT s_fk FOREIGN KEY (schedule_id) REFERENCES SCHEDULE(id)
);


-- USERS table for registered public data

CREATE TABLE USERS(
    id NUMBER(4) PRIMARY KEY,
    full_name VARCHAR2(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_no NUMBER(10),
    date_of_birth DATE,
    password VARCHAR(30)
);

-- INSERT INTO USERS VALUES(601,'Gurdeep Mishra','gurdeep1@xyz.com',1234567890, TO_TIMESTAMP('02-OCT-1998', 'DD-MON-YYYY'),'GURDEEP1');
-- INSERT INTO USERS VALUES(602,'Gautam Jukaria','gautam1@xyz.com',9876543210, TO_TIMESTAMP('10-MAR-1998', 'DD-MON-YYYY'),'GAUTAM1');



-- ADMIN table for registered Admins data

CREATE TABLE ADMIN(
    id NUMBER(4) PRIMARY KEY,
    full_name VARCHAR2(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(30)
);

-- Password stored in Users and Admin table is Base64 encoding of the original password
-- Below statement will create a default Admin profile with user id = admin@lti and password = admin#123
INSERT INTO ADMIN VALUES(1, 'Admin User', 'admin@lti', 'YWRtaW4jMTIz');


-- SEATS table to store no of seats and their availability for a flight-schedule

CREATE TABLE SEATS (
    id VARCHAR2(4) PRIMARY KEY,
    fs_id NUMBER(4),
    status VARCHAR2(20),
    class VARCHAR2(20),
    CONSTRAINT fs_fk FOREIGN KEY (fs_id) REFERENCES FLIGHT_SCHEDULE(id)
);


-- BOOKING table to store user and flight-schedule pair

CREATE TABLE BOOKING(
    id NUMBER(4) PRIMARY KEY,
    user_id NUMBER(4),
    fs_id NUMBER(4),
    booking_datetime TIMESTAMP,
    total_passengers NUMBER(3) NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    status VARCHAR2(20),
    CONSTRAINT bu_fk FOREIGN KEY (user_id) REFERENCES USERS(id),
    CONSTRAINT bfs_fk FOREIGN KEY (fs_id) REFERENCES FLIGHT_SCHEDULE(id)
);


-- PASSENGERS table to store seats and passenger details booked by a user

CREATE TABLE PASSENGERS(
    id NUMBER(4) PRIMARY KEY,
    title VARCHAR2(5),
    full_name VARCHAR2(30) NOT NULL,
    gender VARCHAR2(10) NOT NULL,
    age NUMBER(3) NOT NULL,
    phone_number NUMBER(12) NOT NULL,
    seat_number VARCHAR2(4),
    booking_id NUMBER(4),
    CONSTRAINT ps_fk FOREIGN KEY (seat_number) REFERENCES SEATS(id),
    CONSTRAINT pb_fk FOREIGN KEY (booking_id) REFERENCES BOOKING(id)
);

COMMIT;



