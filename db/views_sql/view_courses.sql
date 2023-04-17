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




