-- Insert five tuples into the users table
INSERT INTO users (user_id, username, email, password, created_at, updated_at)
VALUES 
    (1, 'john', 'john@example.com', 'password', '2022-01-01', NULL),
    (2, 'jane', 'jane@example.com', 'password', '2022-01-01', NULL),
    (3, 'bob', 'bob@example.com', 'password', '2022-01-01', NULL),
    (4, 'alice', 'alice@example.com', 'password', '2022-01-01', NULL),
    (5, 'sam', 'sam@example.com', 'password', '2022-01-01', NULL);

-- Insert five tuples into the roles table
INSERT INTO roles (role_id, role_name)
VALUES 
    (0, 'admin'),
    (1, 'user');

-- Insert five tuples into the users_roles table
INSERT INTO users_roles (user_id, role_id)
VALUES 
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1);

-- Insert five tuples into the payment_status table
INSERT INTO payment_status (payment_status_id, status_name)
VALUES 
    (1, 'pending'),
    (2, 'paid'),
    (3, 'refunded'),
    (4, 'cancelled'),
    (5, 'failed');

-- Insert five tuples into the level_courses table
INSERT INTO level_courses (level_id, level_name)
VALUES 
    (1, 'Beginner'),
    (2, 'Intermediate'),
    (3, 'Advanced'),
    (4, 'Expert'),
    (5, 'Master');

-- Insert five tuples into the courses table
INSERT INTO courses (course_id, title, description, price, instructor, created_at, updated_at, level_id)
VALUES 
    (1, 'Introduction to SQL', 'This course provides an introduction to SQL.', 49.99, 'John Doe', '2022-01-01', NULL, 1),
    (2, 'Advanced SQL', 'This course covers advanced topics in SQL.', 99.99, 'Jane Smith', '2022-01-01', NULL, 3),
    (3, 'Database Design', 'This course covers database design concepts.', 79.99, 'Bob Johnson', '2022-01-01', NULL, 2),
    (4, 'Data Analysis', 'This course covers data analysis techniques.', 149.99, 'Alice Lee', '2022-01-01', NULL, 4),
    (5, 'Business Intelligence', 'This course covers business intelligence concepts.', 199.99, 'Sam Wilson', '2022-01-01', NULL, 5);

-- Insert 5 tuples into register_course table
INSERT INTO register_course (register_id, user_id, course_id, register_date)
VALUES (1, 1, 1, '2022-01-01'),
(2, 2, 1, '2022-02-01'),
(3, 3, 2, '2022-03-01'),
(4, 1, 3, '2022-04-01'),
(5, 2, 2, '2022-05-01');

-- Insert 5 tuples into orders table
INSERT INTO orders (order_id, user_id, order_date, total_amount, payment_status_id)
VALUES (1, 1, '2022-01-01', 100.00, 1),
(2, 2, '2022-02-01', 50.00, 2),
(3, 3, '2022-03-01', 75.00, 1),
(4, 1, '2022-04-01', 125.00, 2),
(5, 2, '2022-05-01', 80.00, 1);

-- Insert 5 tuples into order_items table
INSERT INTO order_items (item_id, order_id, course_id, price, quantity)
VALUES (1, 1, 1, 50.00, 2),
(2, 1, 2, 25.00, 1),
(3, 2, 1, 50.00, 1),
(4, 3, 2, 25.00, 3),
(5, 4, 3, 75.00, 1);

-- Insert 5 tuples into categories table
INSERT INTO categories (category_id, category_name)
VALUES (1, 'Programming'),
(2, 'SQL'),
(3, 'Design'),
(4, 'Big Data'),
(5, 'AI');

-- Insert 5 tuples into course_categories table
INSERT INTO course_categories (course_id, category_id)
VALUES (1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5);