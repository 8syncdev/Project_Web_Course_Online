IF DB_ID('Web_Course_Online') IS NOT NULL
BEGIN
    DROP DATABASE Web_Course_Online
END

CREATE DATABASE Web_Course_Online
USE Web_Course_Online

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);
-- Create roles table
CREATE TABLE roles (
role_id INT PRIMARY KEY,
role_name VARCHAR(50) NOT NULL
);

-- Create users_roles table
CREATE TABLE users_roles (
user_id INT NOT NULL,
role_id INT NOT NULL,
CONSTRAINT FK_users_roles_users FOREIGN KEY (user_id) REFERENCES users(user_id),
CONSTRAINT FK_users_roles_roles FOREIGN KEY (role_id) REFERENCES roles(role_id),
PRIMARY KEY (user_id, role_id)
);
-- Create payment_status table
CREATE TABLE payment_status (
    payment_status_id INT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Create level_courses table
CREATE TABLE level_courses (
    level_id INT PRIMARY KEY,
    level_name VARCHAR(50) NOT NULL
);
-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    instructor VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    level_id INT NOT NULL,
    CONSTRAINT FK_courses_level_courses FOREIGN KEY (level_id) REFERENCES level_courses(level_id)
);

-- Create register_course table
CREATE TABLE register_course (
    register_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    register_date DATETIME NOT NULL,
    CONSTRAINT FK_register_course_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_register_course_courses FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_status_id INT NOT NULL,
    CONSTRAINT FK_orders_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_orders_payment_status FOREIGN KEY (payment_status_id) REFERENCES payment_status(payment_status_id)
);

-- Create order_items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    course_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT FK_order_items_orders FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT FK_order_items_courses FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Create course_categories table
CREATE TABLE course_categories (
    course_id INT NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT FK_course_categories_courses FOREIGN KEY (course_id) REFERENCES courses(course_id),
    CONSTRAINT FK_course_categories_categories FOREIGN KEY (category_id) REFERENCES categories(category_id),
    PRIMARY KEY (course_id, category_id)
);

-- Create budget table
CREATE TABLE budget (
budget_id INT PRIMARY KEY,
user_id INT NOT NULL,
amount DECIMAL(10,2) NOT NULL,
start_date DATETIME NOT NULL,
end_date DATETIME NOT NULL,
CONSTRAINT FK_budget_users FOREIGN KEY (user_id) REFERENCES users(user_id)
);




-- Constraint:

-- Add check constraint for amount field in budget table
ALTER TABLE budget ADD CONSTRAINT CHK_budget_amount CHECK (amount > 0);

-- Add NOT NULL constraint for start_date field in budget table
ALTER TABLE budget ALTER COLUMN start_date DATETIME NOT NULL;

-- Add NOT NULL constraint for end_date field in budget table
ALTER TABLE budget ALTER COLUMN end_date DATETIME NOT NULL;

-- Add UNIQUE constraint for username field in users table
ALTER TABLE users ADD CONSTRAINT UQ_users_username UNIQUE (username);

-- Add CHECK constraint for price field in courses table
ALTER TABLE courses ADD CONSTRAINT CHK_courses_price CHECK (price > 0);

-- Add NOT NULL constraint for description field in courses table
ALTER TABLE courses ALTER COLUMN description TEXT NOT NULL;


-- Create foreign key constraints for register_course table
ALTER TABLE register_course ADD CONSTRAINT FK_register_course_users_CASCADE FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;
ALTER TABLE register_course ADD CONSTRAINT FK_register_course_courses_CASCADE FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE;

-- Create foreign key constraints for orders table
ALTER TABLE orders ADD CONSTRAINT FK_orders_users_CASCADE FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;
ALTER TABLE orders ADD CONSTRAINT FK_orders_payment_status_CASCADE FOREIGN KEY (payment_status_id) REFERENCES payment_status(payment_status_id) ON DELETE CASCADE;

-- Create foreign key constraints for order_items table
ALTER TABLE order_items ADD CONSTRAINT FK_order_items_orders_CASCADE FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE;
ALTER TABLE order_items ADD CONSTRAINT FK_order_items_courses_CASCADE FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE;

-- Create foreign key constraints for course_categories table
ALTER TABLE course_categories ADD CONSTRAINT FK_course_categories_courses_CASCADE FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE;
ALTER TABLE course_categories ADD CONSTRAINT FK_course_categories_categories_CASCADE FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE;

-- Add NOT NULL constraint for username field in users table
ALTER TABLE users ALTER COLUMN username VARCHAR(50) NOT NULL;

-- Add NOT NULL constraint for email field in users table
ALTER TABLE users ALTER COLUMN email VARCHAR(100) NOT NULL;

-- Add NOT NULL constraint for password field in users table
ALTER TABLE users ALTER COLUMN password VARCHAR(255) NOT NULL;

-- Add NOT NULL constraint for payment_status_name field in payment_status table
ALTER TABLE payment_status ALTER COLUMN status_name VARCHAR(50) NOT NULL;

-- Add NOT NULL constraint for level_name field in level_courses table
ALTER TABLE level_courses ALTER COLUMN level_name VARCHAR(50) NOT NULL;

-- Add NOT NULL constraint for title field in courses table
ALTER TABLE courses ALTER COLUMN title VARCHAR(255) NOT NULL;

-- Add NOT NULL constraint for price field in courses table
ALTER TABLE courses ALTER COLUMN price DECIMAL(10,2) NOT NULL;

-- Add NOT NULL constraint for instructor field in courses table
ALTER TABLE courses ALTER COLUMN instructor VARCHAR(100) NOT NULL;

-- Add NOT NULL constraint for category_name field in categories table
ALTER TABLE categories ALTER COLUMN category_name VARCHAR(50) NOT NULL;

-- Add NOT NULL constraint for register_date field in register_course table
ALTER TABLE register_course ALTER COLUMN register_date DATETIME NOT NULL;

