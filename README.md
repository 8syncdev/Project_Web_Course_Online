## Contact: 0767449819

# **TABLE OF CONTENTS**

# Contents

[Topic Introduction 5](#_heading=h.gjdgxs)

[I. PROJECT SPECIFICATIONS 7](#_heading=h.30j0zll)

[1. Data used in the project. 7](#_heading=h.1fob9te)

[2. Describe Functions: 8](#_heading=h.3znysh7)

[II. DESIGN DATABASE 10](#_heading=h.2et92p0)

[1. Design database with conceptual level: ERD 10](#_heading=h.tyjcwt)

[2. Design database with logical level 11](#_heading=h.3dy6vkm)

[3. Describe the meaning of the above relations and constraints 13](#_heading=h.1t3h5sf)

[III. Implementation 15](#_heading=h.4d34og8)

[1. Describe procedure in the project: 15](#_heading=h.2s8eyo1)

[2. Describe function in the project: 26](#_heading=h.17dp8vu)

[3. Describe view in the project: 29](#_heading=h.3rdcrjn)

[4. Describe trigger in the project: 40](#_heading=h.26in1rg)

[5. Describe grant in the project: 41](#_heading=h.lnxbz9)

[6. Retrieve data from SQL server into Django: 46](#_heading=h.35nkun2)

[IV. Conclusion 60](#_heading=h.1ksv4uv)

[1. Assessment for project: 60](#_heading=h.44sinio)

[2. Reference sources: 61](#_heading=h.2jxsxqh)

[3. Immensely grateful: 62](#_heading=h.z337ya)

# Topic Introduction

The project "Online Web Course using SQL Server in Database Management" focuses on the development of an online learning platform that utilizes SQL Server for efficient data management. This project aims to provide an interactive and user-friendly web-based environment for students and instructors to collaborate, access course materials, and submit assignments.

As technology continues to reshape the educational landscape, online learning platforms have gained immense popularity due to their flexibility and accessibility. However, managing large amounts of dataposes significant challenges. Therefore, the implementation of a robust database management system becomes crucial to ensure seamless and organized operations.

The utilization of SQL Server, a powerful and widely-used relational database management system, offers numerous advantages for the development of such a web-based course platform. SQL Server provides a reliable and scalable infrastructure to store and manage various types of data, facilitating efficient data retrieval and manipulation. Its support for structured query language (SQL) enables the creation of complex and optimized queries, enhancing the platform's performance.

This project aims to address key aspects of online course management, including user authentication, course enrollment, content management, and assignment submission. By leveraging the capabilities of SQL Server, the project will focus on designing and implementing an intuitive database schema to represent course information, user profiles, and assignment records. Furthermore, data integrity and security measures will be implemented to ensure the confidentiality and reliability of the system.

In addition, the project will explore the integration of SQL Server with the web application, allowing seamless interaction between the front-end user interface and the database backend. This integration will enable real-time updates and synchronization of data, ensuring that all stakeholders have access to the most up-to-date course information.

By developing this Online Web Course using SQL Server in Database Management project, we aim to provide a comprehensive solution that optimizes the management of online courses. This project will serve as a valuable tool for educational institutions, instructors, and students, streamlining the learning experience and facilitating efficient course administration. Through the application of SQL Server and effective database management techniques, we aim to enhance the overall efficiency and effectiveness of online education platforms.

# I. PROJECT SPECIFICATIONS

## 1. Data used in the project.

- **users** : This table stores user information for the online course platform, including their user ID, username, email, password, and timestamps for creation and updates.

- **roles** : The roles table defines different roles or user types in the system, such as student, instructor, or administrator.

- **users\_roles** : This table establishes a many-to-many relationship between users and roles, indicating the roles assigned to each user.

- **payment\_status** : The payment\_status table contains information about different payment statuses, such as "pending," "completed," or "failed."

- **level\_courses** : This table defines the different levels or difficulty tiers of courses available on the platform.

- **courses** : The courses table stores information about each course, including its ID, title, description, price, instructor, timestamps, and the associated level ID.

- **register\_course** : This table tracks the registration of users for courses, including the registration ID, user ID, course ID, and the registration date.

- **orders** : The orders table stores information about orders made by users, including the order ID, user ID, order date, total amount, and the payment status ID.

- **order\_items** : This table contains details about individual items within an order, such as the item ID, order ID, course ID, price, and quantity.

- **categories** : The categories table defines different categories or subjects for courses, such as "programming," "mathematics," or "business."

- **course\_categories** : This table establishes a many-to-many relationship between courses and categories, indicating the categories associated with each course.

- **budget** : The budget table stores information about the budget of users, including the budget ID, user ID, amount, start date, and end date. The table includes a constraint to ensure the amount is greater than or equal to 0.

These tables and their relationships form the foundation of the database structure for the Online Web Course platform, allowing for efficient storage and retrieval of data related to users, courses, registrations, orders, and other relevant entities.

## 2. Describe Functions:

- List all paid courses: Retrieve a list of all the courses you have paid for, including their details and registration information.
- List all registered courses: Obtain a list of all the courses you have registered for, including their details and registration information.
- Check level and category existence: Verify if a specific level and category exist in the system and inform you if they are available.
- Check wallet existence: Confirm whether you have a wallet (budget) and inform you if it exists.
- Get current money: Check the current balance of money in your wallet.
- Count registered courses: Determine the number of courses you have registered for.
- Calculate total money spent on registered courses: Compute the total amount of money you have spent on registered courses.
- Verify login: Authenticate your login credentials and notify you if they are correct.
- Create budget: Establish a budget (wallet) for you.
- Deduct from budget: Subtract a specific amount from your budget.
- Delete registered courses: Remove a registered course from your list.
- Delete user: Permanently delete your user account and all associated records from the system.
- Deposit into budget: Add a specific amount of money to your budget.
- Set payment status to "paid": Update the payment status of an order to "paid".
- Process transaction: Perform a transaction for a registered course, deducting the required amount from your budget and updating the payment status.
- Loop through transactions: Iterate through all your orders and process transactions for each registered course.
- Process all transactions: Execute transactions for all your orders, ensuring you have enough funds in your budget.
- Add course: Include a new course in the system, providing the title, description, price, instructor, level, and category.
- Update course: Modify the information of an existing course, such as the title, description, price, instructor, level, and category.

# II. DESIGN DATABASE

## 1. Design database with conceptual level: ERD

![](RackMultipart20230528-1-zj8mc7_html_a7c5a26702604d02.png)

**Relationships** :

The users table has a one-to-many relationship with the users\_roles table, as a user can have multiple roles.

The users table has a one-to-many relationship with the register\_course table, as a user can register for multiple courses.

The courses table has a one-to-many relationship with the register\_course table, as a course can have multiple registrations.

The users table has a one-to-many relationship with the orders table, as a user can place multiple orders.

The payment\_status table has a one-to-many relationship with the orders table, as a payment status can be associated with multiple orders.

The orders table has a one-to-many relationship with the order\_items table, as an order can contain multiple items.

The courses table has a one-to-many relationship with the order\_items table, as a course can be included in multiple orders.

The categories table has a one-to-many relationship with the course\_categories table, as a category can have multiple course associations.

The courses table has a one-to-many relationship with the course\_categories table, as a course can belong to multiple categories.

The users table has a one-to-one relationship with the budget table, as a user can have multiple budget entries.

## 2. Design database with logical level

**Table: users**

user\_id (INT, PRIMARY KEY)

username (VARCHAR(50), NOT NULL)

email (VARCHAR(100), NOT NULL, UNIQUE)

password (VARCHAR(255), NOT NULL)

created\_at (DATETIME, DEFAULT GETDATE())

updated\_at (DATETIME)

**Table: budget**

budget\_id (INT PRIMARY KEY)

user\_id (INT,NOT NULL,FOREIGN KEY REFERENCES users(user\_id)),

amount (DECIMAL(10,2) NOT NULL)

start\_date (DATETIME NOT NULL)

end\_date (DATETIME NOT NULL)

**Table: roles**

role\_id (INT, PRIMARY KEY)

role\_name (VARCHAR(50), NOT NULL)

**Table: users\_roles**

user\_id (INT, NOT NULL, FOREIGN KEY REFERENCES users(user\_id))

role\_id (INT, NOT NULL, FOREIGN KEY REFERENCES roles(role\_id))

PRIMARY KEY (user\_id, role\_id)

**Table: courses**

course\_id (INT, PRIMARY KEY)

title (VARCHAR(255), NOT NULL)

description (TEXT, NOT NULL)

price (DECIMAL(10,2), NOT NULL)

instructor (VARCHAR(100), NOT NULL)

created\_at (DATETIME, DEFAULT GETDATE())

updated\_at (DATETIME)

**Table: categories**

category\_id (INT, PRIMARY KEY)

category\_name (VARCHAR(50), NOT NULL)

**Table: course\_categories**

course\_id (INT, NOT NULL, FOREIGN KEY REFERENCES courses(course\_id))

category\_id (INT, NOT NULL, FOREIGN KEY REFERENCES categories(category\_id))

PRIMARY KEY (course\_id, category\_id)

**Table: regist**** er\_course**

registration\_id (INT, PRIMARY KEY)

user\_id (INT, NOT NULL, FOREIGN KEY REFERENCES users(user\_id))

course\_id (INT, NOT NULL, FOREIGN KEY REFERENCES courses(course\_id))

registration\_date (DATETIME, NOT NULL)

**Table: orders**

order\_id (INT, PRIMARY KEY)

user\_id (INT, NOT NULL, FOREIGN KEY REFERENCES users(user\_id))

order\_date (DATETIME, NOT NULL)

total\_amount (DECIMAL(10,2), NOT NULL)

**Table: order\_items**

item\_id (INT, PRIMARY KEY)

order\_id (INT, NOT NULL, FOREIGN KEY REFERENCES orders(order\_id))

course\_id (INT, NOT NULL, FOREIGN KEY REFERENCES courses(course\_id))

price (DECIMAL(10,2), NOT NULL)

quantity (INT, NOT NULL)

## 3. Describe the meaning of the above relations and constraints

| **Table Name** | **Target** |
| --- | --- |
| users | including their unique user\_id, username, email, password, created\_at, and updated\_at timestamps. |
| roles | represents the different roles that users can have, identified by a unique role\_id and their role\_name. |
| users\_roles | establishes a many-to-many relationship between users and roles. It contains the user\_id and role\_id columns, referencing the users and roles tables, respectively. The primary key constraint ensures a user can have multiple roles and vice versa. |
| payment\_status | defines various payment statuses, identified by a unique payment\_status\_id and their status\_name. |
| level\_courses | represents the different levels a course can have, identified by a unique level\_id and their level\_name. |
| courses | including their unique course\_id, title, description, price, instructor, created\_at, updated\_at, and the associated level\_id referencing the level\_courses table. |
| register\_course | table tracks the registrations of users for courses. It includes the register\_id, user\_id, course\_id, and register\_date columns, where user\_id and course\_id reference the users and courses tables, respectively. The primary key constraint ensures a user can register for a course only once on a specific date. |
| orders | represents the orders placed by users, including their unique order\_id, user\_id, order\_date, total\_amount, and payment\_status\_id referencing the users and payment\_status tables, respectively. |
| order\_items | The table contains information about individual items in an order. It includes the item\_id, order\_id, course\_id, price, and quantity columns. The order\_id and course\_id reference the orders and courses tables, respectively. |
| categories | The table stores the different categories of courses, identified by a unique category\_id and their category\_name. |
| course\_categories | The table establishes a many-to-many relationship between courses and categories. It includes the course\_id and category\_id columns, which reference the courses and categories tables, respectively. The primary key constraint ensures a course can belong to multiple categories and vice versa. |
| budget | The table represents budget information, including the budget\_id, user\_id, amount, start\_date, and end\_date columns. The user\_id references the users table. The amount is restricted to be non-negative using a check constraint, and the start\_date and end\_date columns are set to be non-null. |

# III. Implementation

## 1. Describe procedure in the project:

**1.1.**** Procedure to post the courses:**

![](RackMultipart20230528-1-zj8mc7_html_f7dcc323372bea58.png)

The stored procedure inserts a new course into the table **courses** while ensuring the existence of the specified level and category. If the level or category is not found, it raises an error. Otherwise, it performs the necessary inserts and returns the newly generated ' course\_id '.

**1.2.**** Store procedure to update a course**

![](RackMultipart20230528-1-zj8mc7_html_7096912e0957de34.png)

The stored procedure updates the details of an existing course in the database while ensuring the existence of the specified level and category. It performs the necessary updates on the courses and course\_categories tables and returns 1 to indicate success. If the level, category, or course is not found, it raises an error and returns 0.

**1.3. Stored procedure to delete course**

![](RackMultipart20230528-1-zj8mc7_html_7a0f1c0effbc9c78.png)

- This store procedure is used to delete a course from the database based on the given **@course\_id**. It deletes a course from the database by removing the corresponding records from the **courses** and **course\_categories** tables. It checks the existence of the course and raises an error if it is not found. The stored procedure returns 1 on success and 0 on failure.

**1.4. Procedure for granting user rights to admin role**

- ![](RackMultipart20230528-1-zj8mc7_html_4a835e3ebac7526.png)

**-** The stored procedure updates the authorization of a user by resetting their role to a default value (0) in the users\_roles table. It also updates the updated\_at column in the users table. The stored procedure checks the existence of the user and raises an error if the user is not found. The stored procedure returns 1 on success and 0 on failure.

**1.5. Procedure to delete user**

![](RackMultipart20230528-1-zj8mc7_html_63d44d4d3196345e.png)

**-** The sp\_delete\_user stored procedure is responsible for deleting a user and its associated data from the database. It first verifies if the user exists in the users table, raising an error if not found. If the user exists, it removes related records from the register\_course, budget, and users\_roles tables to ensure data consistency. Afterward, it deletes the user record from the users table. The procedure concludes by returning a value of 1 to indicate a successful deletion.

**1.6. Procedure for setting user rights to user role**

![](RackMultipart20230528-1-zj8mc7_html_252257b0b17b6afc.png)

- **-** The sp\_role\_to\_user is designed to update the role of a user in the "users\_roles" table and update the "updated\_at" column in the "users" table. If the user does not exist, it raises an error and returns 0. Otherwise, it returns 1 to indicate successful execution.

**1.7. Procedure to delete registered courses**

![](RackMultipart20230528-1-zj8mc7_html_ecd7d793132f7659.png)

- The sp\_delete\_reg\_courses deletes a register\_course from register\_course table with the matching register\_id and user\_id.

**1.8. Procedure to add register\_courses**

![](RackMultipart20230528-1-zj8mc7_html_42c36e320fcc588d.png)

**-** The sp\_reg\_courses adds a new course a user has registered. It first checks if the course has been registered by the user, if yes select 0 to indicate an error and stop the procedure. Otherwise, the procedure inserts a new tuple in register\_course, using the current max value of register\_id + 1 as the primary key value. Next, we get the price of the registered course with the matching course\_id. Then the procedure adds a new row in orders and order\_items tables respectively. Select 1 to indicate the successful insertion.

**1.9. Procedure to create budget**

![](RackMultipart20230528-1-zj8mc7_html_1d267203b409e7bf.png)

**-** The sp\_create\_budget creates a new budget for a user. It first checks whether a budget has existed for the user. If not, then insert a new row in budget table.

**1.10. Procedure to add money into budget**

![](RackMultipart20230528-1-zj8mc7_html_fd840b39226881d8.png)

**-** The sp\_deposit+budget increases the amount in a user's budget. It first checks if the user's budget exists, if not, the procedure calls sp\_create\_budget to create a budget for the user. Otherwise, we increase the amount in the user's budget.
 **1.11. Procedure to deduct money from budget**

![](RackMultipart20230528-1-zj8mc7_html_7af25245877ffd66.png)

**-** The sp\_deduct\_from\_budget reduces the money in a user's budget. It first checks if the user has an existing budget, if yes then we update deduct the money from the budget.

**1.12. Procedure to set payment status after a user has finished payment**

![](RackMultipart20230528-1-zj8mc7_html_11d997e4a5f2cf9e.png)

**-** The sp\_set\_payment\_status\_to\_paid sets the payment\_status\_id to 2 (successful payment) in a user's order. It first checks if the order\_id exists, if yes the procedure updates the order's payment\_status\_id to 2.

**1.13. Procedure to process one transaction**

![](RackMultipart20230528-1-zj8mc7_html_bad5c7d5b546c362.png)

**-** The sp\_processTransactionProc processes an order's payment. If an error occurs in the procedure, all statements are canceled. First we check if the payment status of the order is 1 (pending) or 5 (failed), if yes then we start checking the user's total money and the order money. If the user has sufficient money for the transaction, we call sp\_deduct\_from\_budget and sp\_set\_payment\_status\_to\_paid.

**1.14. Procedure to loop through all orders of a user**

![](RackMultipart20230528-1-zj8mc7_html_e6969ed7d1c7e35b.png)

**-** The sp\_Loop\_TransactionForAllOrders is a loop to process all orders' transactions of a user. It calls sp\_processTransactionProc for all orders of the user.

**1.15. Procedure to process transactions for all orders of a user**

![](RackMultipart20230528-1-zj8mc7_html_42e9aaf92a0ed7cf.png)

**-** The sp\_processTransactionForAllOrders checks whether the transaction for all orders of a user is possible by checking the total amount of money of the orders and the money the user has. Only orders that have payment status equals to 1 (pending) or 5 (failed) are processed. If the user has sufficient money for the payment then the procedure executes sp\_Loop\_TransactionForAllOrders.

## 2. Describe function in the project:

**2.1. Function to list all registered courses**

![](RackMultipart20230528-1-zj8mc7_html_23e3874ad81cdb42.png)

![](RackMultipart20230528-1-zj8mc7_html_48c6cd5de7756be9.png)

**-** The func\_list\_all\_reg\_courses returns a detailed table of courses that a user has registered, including course id, course's title, course's description, course's price, course's instructor, course created time, course update time, course's level, register id when the user registered the course, register time.

**2.2. Function to get the number of registered courses of a user**

![](RackMultipart20230528-1-zj8mc7_html_be23464af4e70a91.png)

**-** The func\_num\_reg\_courses returns the number of registered courses of a user.

**2.3. Function to get the total money of the registered courses of a user**

![](RackMultipart20230528-1-zj8mc7_html_7887e353c8eade7c.png)

**-** The func\_total\_money\_reg\_courses returns the total money of all the registered courses of a user. If the user has no registered courses, it returns 0.

**2.4. Function to check valid exist data level and category exist**

![](RackMultipart20230528-1-zj8mc7_html_e38864ab960e7633.png)

- The function is designed to check if a combination of "level\_id" and "category\_id" exists in the "level\_courses" and "categories" tables. If such a combination exists, the function returns 1; otherwise, it returns 0.

**2.5. Function to list all paid courses**

![](RackMultipart20230528-1-zj8mc7_html_7ce91ca4bb2f5d07.png)

![](RackMultipart20230528-1-zj8mc7_html_cff9623f6e700479.png)

**-** The func\_list\_all\_paid\_courses returns a detailed table of courses that a user has paid, including course id, course's title, course's description, course's price, course's instructor, course created time, course update time, course's level, register id when the user registered the course, register time.

**2.6. Function to check if a user's wallet exists**

![](RackMultipart20230528-1-zj8mc7_html_7c3e8a990d3c32ba.png)

- The func\_check\_wallet\_exist checks if a user already has a wallet created. If yes, return 1. If not, return 0.

## 3. Describe view in the project:

**3.1.**** View shows all user and admin accounts**

![](RackMultipart20230528-1-zj8mc7_html_1e0b79b6493562b4.png)

The **v\_user\_info** view provides a comprehensive overview of user account information, including their details, budget amount, number of registered courses, and assigned role.

**3.2.**** The provided code is creating a view called all\_courses\_info and populating it with the results of a SELECT query.**

CREATEVIEW all\_courses\_info AS

SELECT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, lc.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

JOIN level\_courses lc ON c.level\_id = lc.level\_id;

select\*from all\_courses\_info

The CREATE VIEW statement is used to create a new view named all\_courses\_info.

The SELECT statement following the AS keyword is responsible for retrieving the desired data and populating the view.

- **course\_id** : The unique identifier for the course.
- **title** : The title or name of the course.
- **description** : A brief description of the course content.
- **price** : The cost or price associated with the course.
- **instructor** : The name of the instructor who teaches the course.
- **created\_at** : The date and time when the course was initially created.
- **updated\_at** : The date and time when the course was last updated.
- **level\_name** : The name of the course level (e.g., beginner, intermediate, advanced).
- **category\_names** : A comma-separated list of categories associated with the course.

STUFF: This is a function used to concatenate multiple rows of the category\_name column into a single string, separated by commas. It is using a subquery to retrieve the category names related to each course by joining the course\_categories table with the categories table. The FOR XML PATH ('') part is used to concatenate the results without XML tags. The result of this concatenation is given an alias.

This code will provide you with a result set that includes detailed information about the courses, including their ID, title, description, price, instructor, creation date, update date, course level name, and the names of the categories associated with each course.

**3.3.**** The provided code creates a view called newest\_courses that represents the most recently registered courses in an online web course platform.**

CREATEVIEW newest\_courses AS

SELECT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, lc.level\_name

FROM courses c

INNERJOIN register\_course rc ON c.course\_id = rc.course\_id

INNERJOIN level\_courses lc ON c.level\_id = lc.level\_id

WHERE rc.register\_date =(SELECTMAX(register\_date)FROM register\_course WHERE course\_id = c.course\_id);

SELECT\*FROM newest\_courses

The WHERE clause filters the results based on a condition. It checks for the most recent registration date (register\_date) for each course, determined by the subquery (SELECT MAX(register\_date) FROM register\_course WHERE course\_id = c.course\_id). This ensures that only the courses with the latest registration dates are included in the view.

By executing the query SELECT \* FROM newest\_courses, you will retrieve the information about the most recently registered courses, including their ID, title, description, price, instructor, creation date, update date, and course level name.

**3.4.**** The provided code creates a view called v\_advanced\_courses\_info that represents information about advanced courses in an online web course platform.**

CREATEVIEW v\_advanced\_courses\_info AS

SELECT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, lc.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

INNERJOIN level\_courses lc ON c.level\_id = lc.level\_id

WHERE lc.level\_name ='Advanced';

SELECT\*FROM v\_advanced\_courses\_info

The WHERE clause filters the results based on a condition. In this case, it checks for courses with the level\_name equal to 'Advanced'. This ensures that only advanced courses are included in the view.

**3.5.**** The provided code creates a view called v\_beginner\_courses\_info that represents information about beginner courses in an online web course platform.**

CREATEVIEW v\_beginner\_courses\_info AS

SELECT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, lc.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

JOIN level\_courses lc ON c.level\_id = lc.level\_id

WHERE lc.level\_name ='Beginner';

SELECT\*FROM v\_beginner\_courses\_info

The WHERE clause filters the results based on a condition. In this case, it checks for courses with the level\_name equal to 'Beginner'. This ensures that only beginner courses are included in the view.

**3.6.**** The provided code creates a view called v\_course\_price\_descending that represents information about courses in an online web course platform. The courses are sorted in descending order based on their prices.**

CREATEVIEW v\_course\_price\_descending AS

SELECTTOP 100 PERCENT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, l.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

JOIN level\_courses l ON c.level\_id = l.level\_id

SELECT\*FROM v\_course\_price\_descending

ORDERBY price DESC;

The ORDER BY clause is used to sort the result set in descending order based on the price column.

By executing the query SELECT \* FROM v\_course\_price\_descending ORDER BY price DESC, you will retrieve the information about the courses, including their ID, title, description, price, instructor, creation date, update date, level name, and category names. The result set will be ordered in descending order based on the course price.

**3.7.**** The provided code creates a view called v\_courses\_price\_asc that represents information about courses in an online web course platform. The courses are sorted in ascending order based on their prices.**

CREATEVIEW v\_courses\_price\_asc AS

SELECTTOP 100 PERCENT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, l.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

JOIN level\_courses l ON c.level\_id = l.level\_id

ORDERBY price ASC;

SELECT\*FROM v\_courses\_price\_asc

The ORDER BY clause is used to sort the result set in ascending order based on the price column.

**3.8.**** The provided code creates a view called v\_expert\_courses\_info that represents information about expert-level courses in an online web course platform.**

CREATEVIEW v\_expert\_courses\_info AS

SELECT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, lc.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

JOIN level\_courses lc ON c.level\_id = lc.level\_id

WHERE lc.level\_name ='Expert';

SELECT\*FROM v\_expert\_courses\_info

The WHERE clause filters the results based on a condition. In this case, it checks for courses with the level\_name equal to 'Expert'. This ensures that only expert-level courses are included in the view.

**3.9.**** The provided code creates a view called v\_instructor that represents the list of instructors from the courses table in an online web course platform.**

CREATEVIEW v\_instructor AS

SELECT c.instructor

FROM courses c

SELECT\*FROM v\_instructor

The SELECT statement within the view retrieves the instructor column from the courses table.

The FROM clause specifies that the data is being retrieved from the courses table.

The second part of the code, SELECT \* FROM v\_instructor, selects all the columns from the v\_instructor view.

**3.10.**  **The provided code creates a view called v\_intermediate\_courses\_info that represents information about intermediate-level courses in an online web course platform.**

CREATEVIEW v\_intermediate\_courses\_info AS

SELECT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, lc.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

JOIN level\_courses lc ON c.level\_id = lc.level\_id

WHERE lc.level\_name ='Intermediate';

SELECT\*FROM v\_intermediate\_courses\_info

The WHERE clause filters the results based on a condition. In this case, it checks for courses with the level\_name equal to 'Intermediate'. This ensures that only intermediate-level courses are included in the view.

**3.11.**** The provided code creates a view called v\_latest\_courses that represents information about the latest courses in an online web course platform.**

CREATEVIEW v\_latest\_courses AS

SELECTTOP 100 PERCENT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, l.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

JOIN level\_courses l ON c.level\_id = l.level\_id

ORDERBY c.created\_at DESC;

SELECT\*FROM v\_latest\_courses

The ORDER BY clause is used to sort the result set in descending order based on the created\_at column. This ensures that the latest courses appear at the top.

**3.12.**** The provided code creates a view called v\_master\_courses\_info that represents information about master-level courses in an online web course platform.**

CREATEVIEW v\_master\_courses\_info AS

SELECT c.course\_id, c.title, c.description, c.price, c.instructor, c.created\_at, c.updated\_at, lc.level\_name,

STUFF((SELECT', '+ cat.category\_name FROM course\_categories cc JOIN categories cat ON cc.category\_id = cat.category\_id WHERE cc.course\_id = c.course\_id FORXMLPATH ('')), 1, 2,'')AS category\_names

FROM courses c

JOIN level\_courses lc ON c.level\_id = lc.level\_id

WHERE lc.level\_name ='Master';

SELECT\*FROM v\_master\_courses\_info

The WHERE clause filters the results based on a condition. In this case, it checks for courses with the level\_name equal to 'Master'. This ensures that only master-level courses are included in the view.

**3.13.**** The provided code creates a view called v\_paid\_courses that represents information about paid courses in an online web course platform.**

CREATEVIEW v\_paid\_courses AS

SELECT c.course\_id, c.title, c.price, c.instructor

FROM courses c

INNERJOIN order\_items oi ON c.course\_id = oi.course\_id

INNERJOIN orders o ON oi.order\_id = o.order\_id

INNERJOIN payment\_status ps ON o.payment\_status\_id = ps.payment\_status\_id

WHERE ps.status\_name ='Paid'

select\*from v\_paid\_courses

The WHERE clause filters the results based on a condition. In this case, it checks for courses where the payment status (ps.status\_name) is 'Paid'. This ensures that only courses with a paid status are included in the view.

## 4. Describe trigger in the project:

**4.1. Automatically delete orders when successfully purchased**

**CREATE**** TRIGGER ****trg\_register\_course\_delete**

**ON**  **register\_course**

**AFTER**** DELETE**

**AS**

**BEGIN**

**DELETE**** FROM **** order\_items**

**WHERE**  **course\_id**  **=** **(****SELECT **** course\_id **** FROM **** deleted);**

**DELETE**** FROM **** orders**

**WHERE**  **order\_id**  **=** **(****SELECT **** register\_id **** FROM **** deleted);**

**END**** ;**

This trigger is designed to maintain data consistency by deleting related records from the order\_items and orders tables whenever a deletion occurs in the register\_course table. It ensures that any associated data tied to the deleted course or user is also removed from the respective tables.

## 5. Describe grant in the project:

**5.1. Design decentralized architecture layer.**

![](RackMultipart20230528-1-zj8mc7_html_6e609a288ae0ac02.png)

**5.2. Code to implement role for sql server.**

**Role for user:**

**-- CREATE USER ROLE:**

**CREATE**** ROLE **** [user];**

**-- Grant SELECT, INSERT, UPDATE, and DELETE permissions on the users table**

**GRANT**** SELECT ****,**  **INSERT**** , **** UPDATE ****,**  **DELETE**** ON **** users **** TO **** [user];**

**-- Grant SELECT permission on the roles table**

**GRANT**** SELECT ****ON**  **roles**  **TO** **[user];**

**-- Grant SELECT, INSERT permission on the users\_roles table**

**GRANT**** SELECT ****,**  **INSERT**** ON **** users\_roles **** TO **** [user];**

**-- Grant SELECT permission on the payment\_status table**

**GRANT**** SELECT ****ON**  **payment\_status**  **TO** **[user];**

**-- Grant SELECT permission on the level\_courses table**

**GRANT**** SELECT ****ON**  **level\_courses**  **TO** **[user];**

**-- Grant SELECT permission on the courses table**

**GRANT**** SELECT ****ON**  **courses**  **TO** **[user];**

**-- Grant SELECT permission on the register\_course table**

**GRANT**** SELECT ****ON**  **register\_course**  **TO** **[user];**

**-- Grant SELECT permission on the orders table**

**GRANT**** SELECT ****ON**  **orders**  **TO** **[user];**

**-- Grant SELECT permission on the order\_items table**

**GRANT**** SELECT ****ON**  **order\_items**  **TO** **[user];**

**-- Grant SELECT permission on the categories table**

**GRANT**** SELECT ****ON**  **categories**  **TO** **[user];**

**-- Grant SELECT permission on the course\_categories table**

**GRANT**** SELECT ****ON**  **course\_categories**  **TO** **[user];**

**-- Grant SELECT IN permissions on the budget table**

**GRANT**** SELECT ****ON**  **budget**  **TO** **[user];**

**-- VIEW FOR USER:**

**GRANT**** SELECT ****ON**  **all\_courses\_info**  **TO** **[user];**

**GRANT**** SELECT ****ON**  **v\_beginner\_courses\_info**  **TO** **[user];**

**GRANT**** SELECT ****ON**  **v\_intermediate\_courses\_info**  **TO** **[user];**

**GRANT**** SELECT ****ON**  **v\_expert\_courses\_info**  **TO** **[user];**

**GRANT**** SELECT ****ON**  **v\_master\_courses\_info**  **TO** **[user];**

**GRANT**** SELECT ****ON**  **v\_advanced\_courses\_info**  **TO** **[user];**

**GRANT**** SELECT ****ON**  **v\_courses\_price\_asc**  **TO** **[user];**

**GRANT**** SELECT ****ON**  **v\_course\_price\_descending**  **TO** **[user];**

**GRANT**** SELECT ****ON**  **v\_instructor**  **TO** **[user];**

**-- FUNCTION AND PROCEDURE: lưu ý table func là grant select**

**-- STORE PROCEDURE:**

**GRANT**** EXECUTE ****ON**  **sp\_check\_login**  **TO** **[user];**

**GRANT**** EXECUTE ****ON**  **sp\_reg\_admin\_account**  **TO** **[user];**

**GRANT**** EXECUTE ****ON**  **sp\_reg\_user\_account**  **TO** **[user];**

**Role for user after login:**

**-- CREATE AFTER LOGIN ROLE:**

**CREATE**** ROLE **** [role\_after\_login];**

**-- GRANT TABLE:**

**-- Grant INSERT, UPDATE, DELETE permission on the register\_course table**

**GRANT**** INSERT ****,**  **UPDATE**** , **** DELETE ****ON**  **register\_course**  **TO** **[role\_after\_login];**

**-- Grant INSERT, UPDATE, DELETE permission on the orders table**

**GRANT**** INSERT ****,**  **UPDATE**** , **** DELETE ****ON**  **orders**  **TO** **[role\_after\_login];**

**-- Grant INSERT, UPDATE, DELETE permission on the order\_items table**

**GRANT**** INSERT ****,**  **UPDATE**** , **** DELETE ****ON**  **order\_items**  **TO** **[role\_after\_login];**

**-- Grant INSERT, UPDATE permissions on the budget table**

**GRANT**** INSERT ****,**  **UPDATE**** ON **** budget **** TO **** [role\_after\_login];**

**-- END GRANT TABLE**

**-- STORE PROCEDURE AFTER LOGIN:**

**GRANT**** EXECUTE ****ON**  **sp\_delete\_reg\_courses**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **sp\_reg\_courses**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **sp\_create\_budget**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **sp\_deposit\_budget**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **sp\_set\_payment\_status\_to\_paid**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **sp\_deduct\_from\_budget**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **sp\_processTransactionProc**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **sp\_Loop\_TransactionForAllOrders**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **sp\_processTransactionForAllOrders**  **TO** **[role\_after\_login];**

**-- SCALAR VALUED FUNCTIONS:**

**GRANT**** EXECUTE ****ON**  **func\_num\_reg\_courses**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **func\_total\_money\_reg\_courses**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **func\_check\_wallet\_exist**  **TO** **[role\_after\_login];**

**GRANT**** EXECUTE ****ON**  **func\_get\_current\_money**  **TO** **[role\_after\_login];**

**-- TABLE VALUED FUNCTIONS: chú ý là select**

**GRANT**** SELECT ****ON**  **func\_list\_all\_reg\_courses**  **TO** **[role\_after\_login];**

**GRANT**** SELECT ****ON**  **func\_list\_all\_paid\_courses**  **TO** **[role\_after\_login];**

**Role for admin:**

**-- CREATE ADMIN ROLE:**

**CREATE**** ROLE **** [admin];**

**-- VIEW FOR ADMIN**

**GRANT**** SELECT ****ON**  **v\_user\_info**  **TO** **[admin];**

**-- Store Procedure:**

**GRANT**** EXECUTE ****ON**  **sp\_post\_course**  **TO** **[admin];**

**GRANT**** EXECUTE ****ON**  **sp\_delete\_course**  **TO** **[admin];**

**GRANT**** EXECUTE ****ON**  **sp\_update\_course**  **TO** **[admin];**

**GRANT**** EXECUTE ****ON**  **sp\_update\_user\_authorization**  **TO** **[admin];**

**GRANT**** EXECUTE ****ON**  **sp\_delete\_user**  **TO** **[admin];**

**GRANT**** EXECUTE ****ON**  **sp\_role\_to\_user**  **TO** **[admin];**

**-- SCALAR VALUED FUNCTIONS:**

**GRANT**** EXECUTE ****ON**  **func\_check\_level\_and\_category\_exists**  **TO** **[admin];**

The code begins by creating the "user" role and granting it various permissions. For example, the "user" role is granted SELECT, INSERT, UPDATE, and DELETE permissions on the "users" table, SELECT permissions on the "roles" table, and SELECT, INSERT permissions on other tables like "register\_course," "orders," and "order\_items." These permissions define what actions the users assigned to the "user" role can perform on the corresponding tables.

Next, several views are created and granted SELECT permissions to the "user" role. Views are predefined queries that provide a customized representation of the data from one or more tables. These views allow the "user" role to access specific information such as course details, instructor information, and various categorized courses.

The code then creates the "role\_after\_login" role and grants it permissions to perform actions on specific tables, such as INSERT, UPDATE, and DELETE on the "register\_course," "orders," and "order\_items" tables. Additionally, stored procedures and functions are defined and granted EXECUTE permissions to the "role\_after\_login" role. These stored procedures and functions perform tasks like registering courses, managing budgets, processing transactions, and retrieving relevant information.

Furthermore, the code establishes the "admin" role, which has specific permissions for administrative tasks. The "admin" role is granted SELECT permissions on the "v\_user\_info" view, which provides information about users. The "admin" role is also granted EXECUTE permissions on stored procedures like "sp\_post\_course" (to add a new course), "sp\_delete\_course" (to delete a course), and "sp\_update\_course" (to update course details). These permissions enable the "admin" role to perform administrative operations on the database.

In summary, the decentralized architecture layer implemented in this code defines different user roles and grants them specific permissions to access and manipulate data. By separating roles and permissions, the system ensures that users can only perform authorized actions based on their assigned roles, enhancing security and control over the database.

## 6. Retrieve data from SQL server into Django:

**6.1. Setting up connections database sql server for Django.**

**DATABASES**** = **** {**

**"**** default ****"**** : {**

**"**** ENGINE ****"**** : ****" ****mssql****" ****,**

**"**** NAME ****"**** : ****" ****Web\_Course\_Online****" ****,**

**"**** USER ****"**** : ****" ****account1****" ****,**

**"**** PASSWORD ****"**** : ****" ****123****" ****,**

**"**** HOST ****"**** : ****" ****DESKTOP-R57BPKR****" ****,**

**"**** PORT ****"**** : ****"" ****,**

**"**** OPTIONS ****"**** : {**

**"**** driver ****"**** : ****" ****ODBC Driver 17 for SQL Server****" ****,**

**},**

**},**

**"**** admin ****"**** : {**

**"**** ENGINE ****"**** : ****" ****mssql****" ****,**

**"**** NAME ****"**** : ****" ****Web\_Course\_Online****" ****,**

**"**** USER ****"**** : ****" ****sa****" ****,**

**"**** PASSWORD ****"**** : ****" ****123****" ****,**

**"**** HOST ****"**** : ****" ****DESKTOP-R57BPKR****" ****,**

**"**** PORT ****"**** : ****"" ****,**

**"**** OPTIONS ****"**** : { ****"**** driver ****"**** : ****" ****ODBC Driver 17 for SQL Server****" ****,**

**},**

**},**

**}**

**Explain:**

The code snippet you provided defines a dictionary named "DATABASES" that contains two database configurations: "default" and "admin". Each configuration is represented by a nested dictionary containing various key-value pairs. Let's go through the details of each key:

**"default":**

"ENGINE": Specifies the database engine to be used, which is _ **"mssql"** _ in this case, _ **indicating Microsoft SQL Server** _.

"NAME": Represents the name of the database, which is "Web\_Course\_Online".

"USER": Refers to the username used to authenticate and access the database, which is "account1".

"PASSWORD": Indicates the password associated with the given username, which is "123".

"HOST": Specifies the hostname or IP address of the machine where the database server is running. In this case, it is "DESKTOP-R57BPKR".

"PORT": Represents the port number used to establish a connection to the database. Since it is an empty string, the default port for MSSQL (1433) will be used.

"OPTIONS": Contains additional configuration options for the database connection. Here, it includes a single option, "driver", which is set to "ODBC Driver 17 for SQL Server". This option specifies the ODBC driver to be used for connecting to the SQL Server database.

**"admin":**

Similar to the "default" configuration, this configuration also uses the same database engine, name, and hostname.

"USER": The username for this configuration is set to "sa", which is typically the _ **system administrator account** _ in SQL Server.

"PASSWORD": Specifies the password associated with the "sa" account, which is "123".

"OPTIONS": Includes the same "driver" option as in the "default" configuration, indicating the ODBC driver to be used.

**6.2. Query Data From Sql Server To Use In Django:**

**6.2.1. Import module connection, connections to execute sql in Django:**

**from**  **django.db**  **import**  **connection, connections**

**connection** : By using the connection object, you can execute raw SQL queries directly against the _ **default database** _, fetch results, perform database transactions, and access various properties and methods related to the default database connection.

Example:

- Database default:(You can see it in **6.1** )

**DATABASES**** = **** {**

**"**** default ****"**** : {**

**"**** ENGINE ****"**** : ****" ****mssql****" ****,**

**"**** NAME ****"**** : ****" ****Web\_Course\_Online****" ****,**

**"**** USER ****"**** : ****" ****account1****" ****,**

**"**** PASSWORD ****"**** : ****" ****123****" ****,**

**"**** HOST ****"**** : ****" ****DESKTOP-R57BPKR****" ****,**

**"**** PORT ****"**** : ****"" ****,**

**"**** OPTIONS ****"**** : {**

**"**** driver ****"**** : ****" ****ODBC Driver 17 for SQL Server****" ****,**

**},**

**},**

- How to use:

# get the number of registered courses:

defgetNumUserRegisterCourses(_user\_id_):

with connection.cursor() as cursor:

query ='''

select dbo.func\_num\_reg\_courses(%s) as num\_cart

'''

cursor.execute(query, [_user\_id_])

data =dict\_fetch\_all(cursor)

return data

The function takes a user\_id parameter as input, representing the ID of the user for whom we want to retrieve the number of registered courses.

Inside the function, a database cursor is obtained using connection.cursor(). The connection object is assumed to be imported from django.db module, which represents the default database connection in Django.

The query variable holds an SQL query that selects the result of a function called dbo.func\_num\_reg\_courses, passing the user\_id as a parameter. The specific implementation of this function is not provided in the code snippet.

The cursor.execute() method is used to execute the SQL query, passing the query string and a list containing the user\_id as arguments.

The dict\_fetch\_all() retrieves all the rows returned by the SQL query as a list of dictionaries.

The retrieved data is stored in the data variable, which is then returned as the result of the function.

**connections** : By using the connections object, you can define and configure _ **additional database connections** _ in your Django project settings, switch between _ **different database connections** _, and perform database operations using a specific connection..(for sa, this is admin account).

Example:

- Additional database: (You can see it in **6.1** )

**"**** admin ****"**** : {**

**"**** ENGINE ****"**** : ****" ****mssql****" ****,**

**"**** NAME ****"**** : ****" ****Web\_Course\_Online****" ****,**

**"**** USER ****"**** : ****" ****sa****" ****,**

**"**** PASSWORD ****"**** : ****" ****123****" ****,**

**"**** HOST ****"**** : ****" ****DESKTOP-R57BPKR****" ****,**

**"**** PORT ****"**** : ****"" ****,**

**"**** OPTIONS ****"**** : { ****"**** driver ****"**** : ****" ****ODBC Driver 17 for SQL Server****" ****,**

**},**

**},**

**}**

- How to use:

# add admin role:

defadd\_admin\_role():

with connections['admin'].cursor() as cursor:

query ='''

EXEC sp\_addrolemember 'admin', 'account1';

'''

cursor.execute(query)

**Explanations** :

Inside the function, a database cursor is obtained using connections['admin'].cursor(). The connections object is assumed to be imported from the django.db module and provides access to the named database connections defined in the project settings.

The query variable holds an SQL query that uses the EXEC statement to execute the sp\_addrolemember stored procedure. This stored procedure is typically used in SQL Server to add a user account to a specific role. In this case, it adds the user account 'account1' to the 'admin' role.

The _**cursor.execute()**_ method is used to _ **execute the SQL query** _, which performs the action of adding the admin role to the specified user account.

Note: The _ **sp\_addrolemember** _ stored procedure and the specific syntax used in the query may depend on the database management system being used. In this case, it assumes SQL Server as the database.

Overall, the add\_admin\_role function uses a specific database connection named 'admin' to execute an SQL query that adds the admin role to a user account. The specific user account and the procedure for adding the role may vary depending on the database management system being used.

**6.2.2. Using view SQL SERVER in Django.**

1. **View related to courses:**

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**if** _ **slug** _ **==****' ****all****' ****:**

**# Data Origin:**

**query**  **=****"""**

**select \* from all\_courses\_info**

**"""**

**cursor.**** execute****(query)**

**data\_origin**  **=**** dict\_fetch\_all****(cursor)**

**data**  **=**  **data\_origin**

**elif** _ **slug** _ **==****' ****prices\_asc****' ****:**

**# Prices\_Asc**

**query**  **=****"""**

**SELECT \* FROM v\_courses\_price\_asc**

**"""**

**cursor.**** execute****(query)**

**data\_prices\_asc**  **=**** dict\_fetch\_all****(cursor)**

**data**  **=**  **data\_prices\_asc**

**elif** _ **slug** _ **==****' ****prices\_desc****' ****:**

**# Price\_Desc:**

**query**  **=****"""**

**SELECT \* FROM v\_course\_price\_descending**

**ORDER BY price DESC**

**"""**

**cursor.**** execute****(query)**

**data\_prices\_desc**  **=**** dict\_fetch\_all****(cursor)**

**data**  **=**  **data\_prices\_desc**

**elif** _ **slug** _ **==****' ****beginner****' ****:**

**query**  **=****"""**

**SELECT \* FROM v\_beginner\_courses\_info**

**"""**

**cursor.**** execute****(query)**

**data\_beginner**  **=**** dict\_fetch\_all****(cursor)**

**data**  **=**  **data\_beginner**

**elif** _ **slug** _ **==****' ****intermediate****' ****:**

**query**  **=****"""**

**SELECT \* FROM v\_intermediate\_courses\_info**

**"""**

**cursor.**** execute****(query)**

**data\_intermediate**  **=**** dict\_fetch\_all****(cursor)**

**data**  **=**  **data\_intermediate**

**elif** _ **slug** _ **==****' ****expert****' ****:**

**query**  **=****"""**

**SELECT \* FROM v\_expert\_courses\_info**

**"""**

**cursor.**** execute****(query)**

**data\_expert**  **=**** dict\_fetch\_all****(cursor)**

**data**  **=**  **data\_expert**

**elif** _ **slug** _ **==****' ****master****' ****:**

**query**  **=****"""**

**SELECT \* FROM v\_master\_courses\_info**

**"""**

**cursor.**** execute****(query)**

**data\_master**  **=**** dict\_fetch\_all****(cursor)**

**data**  **=**  **data\_master**

**elif** _ **slug** _ **==****' ****advanced****' ****:**

**query**  **=****"""**

**SELECT \* FROM v\_advanced\_courses\_info**

**"""**

**cursor.**** execute****(query)**

**data\_advanced**  **=**** dict\_fetch\_all****(cursor)**

**data**  **=**  **data\_advanced**

1. **View for mentors:**

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****"""**

**SELECT \* FROM v\_instructor**

**"""**

**cursor.**** execute****(query)**

**mentors**  **=**** dict\_fetch\_all****(cursor)**

**6.2.3. Using procedure of SQL SERVER in Django.**

1. **Procedure for courses:**

Procedure registers courses:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****"""**

**exec sp\_reg\_courses**  **%s**** , ****%s**

**"""**

**cursor.**** execute****(query,[user\_id,** _ **pk** _**])**

Procedure delete the registered coureses:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**exec sp\_delete\_reg\_courses**  **%s**** , ****%s**

**'''**

**cursor.**** execute****(query,[id,** _ **reg\_id** _**])**

Procedure updated coureses:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**exec sp\_update\_course**  **%s**** , ****%s**** , ****%s**** , ****%s**** , ****%s**** , ****%s**** , ****%s**** ;**

**'''**

**cursor.**** execute****(query,data\_POST)**

Procedure post coureses:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**exec sp\_post\_course**  **%s**** , ****%s**** , ****%s**** , ****%s**** , ****%s**** , ****%s**** ;**

**'''**

**cursor.**** execute****(query,data\_POST)**

1. **Procedure for handling login and logout, sign up.**

Procedure for checking login:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query\_func\_login\_user**  **=****"""**

**exec sp\_check\_login**  **%s**** , ****%s**

**"""**

**cursor.**** execute****(query\_func\_login\_user,data\_POST)**

Procedure for registering user account:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query\_proc\_regiser\_user**  **=****"""**

**exec sp\_reg\_user\_account**  **%s**** , ****%s**** , ****%s**** , ****%s**

**"""**  **cursor.**** execute****(query\_proc\_regiser\_user,data\_POST)**

Procedure for registering admin account:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query\_proc\_regiser\_admin**  **=****"""**

**exec sp\_reg\_admin\_account**  **%s**** , ****%s**** , ****%s**** , ****%s**

**"""**

**cursor.**** execute****(query\_proc\_regiser\_admin,data\_POST)**

1. **Procedure for payment.**

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****"""**

**exec sp\_processTransactionForAllOrders**  **%s**

**"""**

**cursor.**** execute****(query,[id])**

1. **Procedure for payment.**

Procedure for creating budget:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**** = ****"""**

**exec sp\_create\_budget**  **%s**** ;**

**"""**

**cursor.**** execute****(query, [id])**

Procedure for deposting budget:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**** = ****"""**

**exec sp\_deposit\_budget**  **%s**** , ****%s**** ;**

**"""**

**cursor.**** execute****(query, [id, data\_POST[****0****]])**

1. **Procedure for admin role.**

Procedure for updating user account to admin account:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**exec sp\_update\_user\_authorization**  **%s**** ;**

**'''**

**cursor.**** execute****(query, [**_ **options** _**])**

Procedure for updating admin account to user account:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**exec sp\_role\_to\_user**  **%s**** ;**

**'''**

**cursor.**** execute****(query, [**_ **options** _**])**

Procedure for updating delete user account:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**exec sp\_delete\_user**  **%s**** ;**

**'''**

**cursor.**** execute****(query, [**_ **options** _**])**

**6.2.4. Using functions of SQL SERVER in Django.**

1. **Functions for courses:**

Procedure for getting the number of registered courses:

**def**** getNumUserRegisterCourses****(**_ **user\_id** _**):**

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**select dbo.func\_num\_reg\_courses(****%s****) as num\_cart**

**'''**

**cursor.**** execute****(query, [**_ **user\_id** _**])**

**data**  **=**** dict\_fetch\_all****(cursor)**

**return**  **data**

Procedure for getting total money registered courses:

**def**** getTotalMoneyRegCourses****(**_ **user\_id** _**):**

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**select dbo.func\_total\_money\_reg\_courses(****%s****) as total\_cost**

**'''**

**cursor.**** execute****(query,[**_ **user\_id** _**])**

**total\_cost**  **=**** dict\_fetch\_all****(cursor)[****0****][****' ****total\_cost****'****]**

**return**  **total\_cost**

Procedure for listing all registered courses:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****"""**

**select \* from dbo.func\_list\_all\_reg\_courses(****%s****)**

**"""**

**cursor.**** execute****(query,[id])**

**data**  **=**** dict\_fetch\_all****(cursor)**

Procedure for listing all paid courses:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****'''**

**select \* from func\_list\_all\_paid\_courses(****%s****)**

**'''**

**cursor.**** execute****(query, [id])**

**data**  **=**** dict\_fetch\_all****(cursor)**

1. **Functions for budget:**

Procedure for checking wallet:

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****"""**

**SELECT dbo.func\_check\_wallet\_exist(****%s****) AS has\_wallet;**

**"""**

**cursor.**** execute****(query,[**_ **user\_id** _**])**

**data**  **=**** dict\_fetch\_all****(cursor)**

Procedure for getting current money:

**def**** getCurrentMoney****(**_ **user\_id** _**):**

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query**  **=****"""**

**SELECT dbo.func\_get\_current\_money(****%s****) As current\_money**

**"""**

**cursor.**** execute****(query,[**_ **user\_id** _**])**

**data**  **=**** dict\_fetch\_all****(cursor)**

1. **Functions for login:**

**with**  **connection.**** cursor****()**  **as**  **cursor:**

**query\_func\_login\_user**  **=****"""**

**exec sp\_check\_login**  **%s**** , ****%s**

**"""**

**cursor.**** execute****(query\_func\_login\_user,data\_POST)**

# IV. Conclusion

## 1. Assessment for project:

**Strengths:**

Well-structured tables: The schema organizes data into separate tables with appropriate relationships and primary/foreign key constraints, ensuring data integrity.

Primary keys: Each table has a primary key, which uniquely identifies each record in the table.

Relationships: The schema defines relationships between tables using foreign keys, allowing for data consistency and efficient queries.

Constraints: The schema includes various constraints such as NOT NULL, UNIQUE, CHECK, and CASCADE constraints, enforcing data validation and integrity.

**Weaknesses/Improvements:**

Lack of indexes: Indexes can improve query performance, especially for frequently accessed columns. Consider adding indexes on columns frequently used in search or join operations.

Missing default values: Some columns such as "updated\_at" in the "users" table are not assigned default values. Consider providing default values for such columns to ensure consistent data entry.

Limited user information: The "users" table lacks fields for storing additional user information like name, address, or contact details. Consider expanding the "users" table with additional columns as per the application requirements.

Missing table for course content: The schema does not include a table for storing the actual content of the courses. Depending on the requirements, consider adding a table to store course content such as videos, documents, or multimedia.

Limited payment information: The schema lacks a table for storing payment details related to user orders. Consider adding a table to store payment information associated with orders, such as payment method, transaction ID, or billing address.

**Future Direction of Improvement:**

Improved reporting and analytics: Incorporate additional tables or views to track user progress, course popularity, or financial performance, allowing for better reporting and data analysis.

Enhanced search and filtering: Implement search functionality across courses, users, or categories to enable users to find relevant information quickly.

Performance optimization: Continuously monitor and optimize query performance by analyzing query execution plans, indexing appropriately, and fine-tuning the database configuration.

## 2. Reference sources:

- Connect SQL server and use it in Django: [https://www.youtube.com/watch?v=hafKozpSpyA](https://www.youtube.com/watch?v=hafKozpSpyA)
- View creation material in MySQL: [https://www.youtube.com/watch?v=QZHScccM500](https://www.youtube.com/watch?v=QZHScccM500), [https://www.youtube.com/watch?v=vLLkNI-vkV8](https://www.youtube.com/watch?v=vLLkNI-vkV8), [Create views - SQL Server | Microsoft Learn](https://learn.microsoft.com/en-us/sql/relational-databases/views/create-views?view=sql-server-ver16), [https://www.youtube.com/watch?v=wciubfRhvtM](https://www.youtube.com/watch?v=wciubfRhvtM), [SQL CREATE VIEW, REPLACE VIEW, DROP VIEW Statements (w3schools.com)](https://www.w3schools.com/sql/sql_view.asp), [How to create a view in SQL Server (sqlshack.com)](https://www.sqlshack.com/how-to-create-a-view-in-sql-server/)
- SQL statements: [https://www.geeksforgeeks.org/](https://www.geeksforgeeks.org/)
- Learning about Cursor to loop through a table: [https://stackoverflow.com/questions/20662356/how-do-i-loop-through-a-set-of-records-in-sql-server](https://stackoverflow.com/questions/20662356/how-do-i-loop-through-a-set-of-records-in-sql-server)
- Settings for connection SQL SERVER in Django: [https://learn.microsoft.com/en-us/samples/azure-samples/mssql-django-samples/mssql-django-samples/](https://learn.microsoft.com/en-us/samples/azure-samples/mssql-django-samples/mssql-django-samples/)

## 3. Immensely grateful:

I hope this note finds you well. We wanted to take a moment to express our sincere gratitude for the project on database management that you assigned to us. It was an incredible learning experience, and we truly appreciate the opportunity to delve into the world of databases and gain hands-on experience.

The project provided us with a comprehensive understanding of designing and implementing a database system. From the initial creation of the database and its tables to the establishment of relationships and constraints, every step allowed us to grasp the essential concepts and techniques involved in managing data effectively.

Working on the project helped us develop crucial skills in SQL and database modeling. We learned how to create tables, define primary and foreign keys, establish relationships between tables, and implement various constraints to ensure data integrity. Moreover, the project challenged us to think critically and problem-solve when encountering issues or conflicts in the database design.

Your guidance and support throughout the project were invaluable. Your clear explanations, insightful feedback, and willingness to address our questions and concerns made the learning process smooth and enjoyable. You fostered an environment that encouraged exploration and experimentation, allowing us to deepen our understanding and refine our skills.

We want to express our gratitude for your dedication to our education and your commitment to helping us succeed. This project not only enhanced our technical knowledge but also instilled in us a sense of accomplishment and confidence in working with databases.

Once again, thank you for providing us with this opportunity to learn and grow. Your expertise and passion for teaching have made a significant impact on our understanding of database management. We are grateful for your guidance and look forward to applying the knowledge and skills we acquired from this project in future endeavors.

45
