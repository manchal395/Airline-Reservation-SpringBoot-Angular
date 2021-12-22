# Airline-Reservation-SpringBoot-Angular

## PROJECT - AIRLINES	(a SpringBoot-Angular Application) <br/> 
  Developed by Anchal Maheshwari (https://github.com/manchal395), Gautam, Gurdeep, Animesh <br/>
  Mentored by Mr. Majrul Ansari (https://www.linkedin.com/in/majrul/)
> Repository for Part A:	project-gladiator (https://github.com/manchal395/project-gladiator) <br/>
> Repository for Part B:	angular-project-gladiator (https://github.com/manchal395/angular-project-gladiator)

### Project Abstract
Online Airline Reservation is a web application developed using <b><i>Scrum Based Agile Methodology</i></b> which provides a user-friendly User Interface and an easy efficient way to search, book and cancel flight tickets.
This application is currently working for multiple airline companies and only for domestic flights. <br/>
User have access to search flights and apply for it. User can register on website to search for flights and book tickets. It also allows user to cancel
flights before a specific time. <br/>

Application is implemented in two parts: <br/>
> Part A - RESTfull web services &nbsp;: API's build using spring boot are used for handling all the backend operations. <br/>
> Part B - Front End &nbsp;: User interfaces designed and developed using Angular utilising web services for handling appropriate user actions.

### Features available based on the user role
- Admin
  - Login
  - Add Flight
  - Delete Flight

- Public
  - Search Flights
  - View Searched Flights
  - Register
  - Login
  - View Dashboard (for Bookings)
  - Booking
    - Book seats
    - Cancel booking
 
 ### Project Details
- Technologies Used
  - Spring Boot
  - Java 8
  - Hibernate, JPA
  - Oracle Database
  - Angular 8
  - HTML. CSS
 
- Prerequisites
  - SpringToolSuite (https://spring.io/tools)
  - Visual Studio Code (https://code.visualstudio.com/download)
  - SQL Developer (https://www.oracle.com/tools/downloads/sqldev-downloads.html) 
 
## Steps to Run the complete Airline Application (Part A + Part B)
### 1. Connect Oracle Database
> MAC users can refer to this guide for Installing Oracle using Docker (https://github.com/manchal395/Notes/blob/master/Docker_Oracle_MACOS.pdf) <br/>

- Database Schema
  <img src="https://github.com/manchal395/Airline-Reservation-SpringBoot-Angular/blob/main/Screenshots/AirlinesSchema.png" />
  
- Run Below SQL script to create the required tables and insert a default Admin data (user id = admin@lti and password = admin#123). <br/>
  -  Passwords stored in Users and Admin table is Base64 encoding of the original string
  -  SQL script - https://github.com/manchal395/Airline-Reservation-SpringBoot-Angular/blob/main/Rafale_script.sql

- Edit the application.properties file of the SpringBoot project (gladiator/src/main/resources/application.properties) according to your system configuration
  - https://github.com/manchal395/project-gladiator/blob/master/gladiator/src/main/resources/application.properties

### 2. Run Angular Project
  https://github.com/manchal395/angular-project-gladiator/blob/master/README.md

### 3. Run Spring Boot Project
  https://github.com/manchal395/project-gladiator/blob/master/README.md
