# E_commerce-Platform

##  Overview

This project presents a fully designed relational database system for a real-world e-commerce platform.
The system manages customers, products, orders, suppliers, and reviews while ensuring data integrity and scalability.



## Database Design

* Designed a fully normalized relational database (up to **Third Normal Form – 3NF**)
* Eliminated redundancy and ensured consistency using normalization principles (1NF, 2NF, 3NF)
* Implemented **primary keys** and **foreign keys** to maintain referential integrity



## Entities

The system includes the following core entities:

* Customer
* Product
* Purchase (Order)
* OrderItem
* Supplier
* Review


## Relationships

* One-to-many: Customer → Orders
* One-to-many: Order → OrderItems
* One-to-many: Product → OrderItems
* One-to-many: Supplier → Products
* One-to-many: Product → Reviews



## Features

* SQL-based schema design
* Real-world transaction simulation
* Structured data for testing and querying
* Data integrity through relational constraints



## ER Diagram

The system architecture is visualized using an Entity-Relationship Diagram (ERD).
<img width="676" height="608" alt="image" src="https://github.com/user-attachments/assets/45f3bcd5-850c-471e-8bd3-bb5896ebac5f" />



## Technologies

* SQL
* Relational Database Design


## Project Status

* Completed as a database design and simulation project
* Not deployed as a web application



## Availability

Full SQL scripts, ER diagram, and documentation are available in this repository.
