

CREATE VIEW all_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id;
GO

--Liệt kê tất cả khóa học cho Beginner.(đủ chi tiết thông tin).
CREATE VIEW v_beginner_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Beginner';
GO

--Liệt kê tất cả khóa học cho intermediate.(đủ chi tiết thông tin).
CREATE VIEW v_intermediate_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Intermediate';
GO

--Liệt kê tất cả khóa học cho expert.(đủ chi tiết thông tin).
CREATE VIEW v_expert_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Expert';
GO

--Liệt kê tất cả khóa học cho master.(đủ chi tiết thông tin).
CREATE VIEW v_master_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c 
JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Master';
GO

--Liệt kê tất cả khóa học cho advanced.(đủ chi tiết thông tin).
CREATE VIEW v_advanced_courses_info AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c
INNER JOIN level_courses lc ON c.level_id = lc.level_id
WHERE lc.level_name = 'Advanced';
GO


--liệt kê các lớp học có giá tăng dần
CREATE VIEW v_courses_price_asc AS
SELECT TOP 100 PERCENT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, l.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c
JOIN level_courses l ON c.level_id = l.level_id
ORDER BY price ASC;
GO

--liệt kê các lớp học có giá giảm dần
CREATE VIEW v_course_price_descending AS
SELECT TOP 100 PERCENT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, l.level_name, 
    STUFF((SELECT ', ' + cat.category_name FROM course_categories cc JOIN categories cat ON cc.category_id = cat.category_id WHERE cc.course_id = c.course_id FOR XML PATH ('')), 1, 2, '') AS category_names
FROM courses c
JOIN level_courses l ON c.level_id = l.level_id
ORDER BY price DESC;
GO

--liệt kê danh sách các users
CREATE VIEW v_user_info AS
SELECT
    u.user_id,
    u.username,
    u.email,
    u.password,
    u.created_at,
    u.updated_at,
    b.amount,
    COUNT(rc.course_id) AS num_courses,
    r.role_name as role
FROM
    users u
LEFT JOIN
    budget b ON u.user_id = b.user_id
LEFT JOIN
    register_course rc ON u.user_id = rc.user_id
LEFT JOIN
    users_roles ur ON u.user_id = ur.user_id
LEFT JOIN
    roles r ON ur.role_id = r.role_id
GROUP BY
    u.user_id,
    u.username,
    u.email,
    u.password,
    u.created_at,
    u.updated_at,
    b.amount,
    r.role_name;
GO

--liệt kê danh sách gia sư
CREATE VIEW v_instructor AS
SELECT c.instructor
FROM courses c
GO

--danh sách các khóa học mới nhất
CREATE VIEW newest_courses AS
SELECT c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, lc.level_name
FROM courses c
INNER JOIN register_course rc ON c.course_id = rc.course_id
INNER JOIN level_courses lc ON c.level_id = lc.level_id
WHERE rc.register_date = (SELECT MAX(register_date) FROM register_course WHERE course_id = c.course_id);

GO
