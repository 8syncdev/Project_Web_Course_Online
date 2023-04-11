
--danh sách sinh viên đăng kí lớp beginner
CREATE VIEW v_beginner_register AS
SELECT r.user_id, u.username, c.title, l.level_name
FROM register_course r
JOIN users u ON r.user_id = u.user_id
JOIN courses c ON r.course_id = c.course_id
JOIN level_courses l ON c.level_id = l.level_id
WHERE l.level_name = 'Beginner';
SELECT * FROM v_beginner_register

--danh sách các course đã được paid
CREATE VIEW v_paid_courses AS
SELECT c.course_id, c.title, c.price, c.instructor
FROM courses c
INNER JOIN order_items oi ON c.course_id = oi.course_id
INNER JOIN orders o ON oi.order_id = o.order_id
INNER JOIN payment_status ps ON o.payment_status_id = ps.payment_status_id
WHERE ps.status_name = 'Paid'
select*from v_paid_courses

--đưa ra các lớp học đã dc đăng kí
CREATE VIEW v_courses_with_categories AS
SELECT courses.course_id, courses.title, courses.description, courses.price, courses.instructor, courses.created_at, courses.updated_at, level_courses.level_name, categories.category_name
FROM courses
INNER JOIN level_courses ON courses.level_id = level_courses.level_id
LEFT JOIN course_categories ON courses.course_id = course_categories.course_id
LEFT JOIN categories ON course_categories.category_id = categories.category_id
select * from v_courses_with_categories


