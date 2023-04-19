

CREATE VIEW all_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id;
select * from all_courses_info
--drop view all_courses_info
--go

--Liệt kê tất cả khóa học cho Beginner.(đủ chi tiết thông tin).
CREATE VIEW v_beginner_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Beginner';
SELECT * FROM v_beginner_courses_info
--drop view v_beginner_courses_info
--go

--Liệt kê tất cả khóa học cho intermediate.(đủ chi tiết thông tin).
CREATE VIEW v_intermediate_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Intermediate';
SELECT * FROM v_intermediate_courses_info
--drop view v_intermediate_courses_info
--go

--Liệt kê tất cả khóa học cho expert.(đủ chi tiết thông tin).
CREATE VIEW v_expert_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Expert';
SELECT * FROM v_expert_courses_info
--drop view v_expert_courses_info
--go

--Liệt kê tất cả khóa học cho master.(đủ chi tiết thông tin).
CREATE VIEW v_master_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Master';
SELECT * FROM v_master_courses_info
--drop view v_master_courses_info
--go

--Liệt kê tất cả khóa học cho advanced.(đủ chi tiết thông tin).
CREATE VIEW v_advanced_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c
INNER JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Advanced';
SELECT * FROM v_advanced_courses_info
--drop view v_advanced_courses_info
--go

--Liệt kê sắp xếp theo created_at mới nhất cho khóa học.
CREATE VIEW v_latest_courses AS
SELECT TOP 100 PERCENT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, l.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c
JOIN level_courses l ON c.level_id = l.level_id
ORDER BY c.created_at DESC;
SELECT * FROM v_latest_courses
--drop view v_latest_courses
--go

--liệt kê các lớp học có giá tăng dần
CREATE VIEW v_courses_price_asc AS
SELECT TOP 100 PERCENT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, l.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c
JOIN level_courses l ON c.level_id = l.level_id
ORDER BY price ASC;
SELECT * FROM v_courses_price_asc
--drop view v_courses_price_asc
--go

--liệt kê các lớp học có giá giảm dần
CREATE VIEW v_course_price_descending AS
SELECT TOP 100 PERCENT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, l.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c
JOIN level_courses l ON c.level_id = l.level_id
ORDER BY price DESC;
SELECT * FROM v_course_price_descending
--drop view v_course_price_descending
--go

--liệt kê danh sách các users
CREATE VIEW v_user_info AS
SELECT u.user_id, u.username, u.email, COUNT(rc.course_id) AS num_courses
FROM users u
LEFT JOIN register_course rc ON u.user_id = rc.user_id
GROUP BY u.user_id, u.username, u.email;
SELECT * FROM v_user_info;

--liệt kê danh sách gia sư
CREATE VIEW v_instructor AS
SELECT c.instructor
FROM courses c
SELECT * FROM v_instructor

--danh sách các khóa học mới nhất
CREATE VIEW newest_courses AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name
FROM courses c
INNER JOIN register_course rc ON c.course_id = rc.course_id
INNER JOIN level_courses lc ON c.level_id = lc.level_id
WHERE rc.register_date = (SELECT MAX(register_date) FROM register_course WHERE course_id = c.course_id);
SELECT * FROM newest_courses

--danh sách các course đã được paid
CREATE VIEW v_paid_courses AS
SELECT c.course_id, c.title, c.price, c.instructor
FROM courses c
INNER JOIN order_items oi ON c.course_id = oi.course_id
INNER JOIN orders o ON oi.order_id = o.order_id
INNER JOIN payment_status ps ON o.payment_status_id = ps.payment_status_id
WHERE ps.status_name = 'Paid'
select*from v_paid_courses