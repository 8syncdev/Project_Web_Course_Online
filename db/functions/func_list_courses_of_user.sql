ALTER    FUNCTION [dbo].[getUserRegisteredCourses] (@user_id int)
RETURNS @LopHocDangKi TABLE (course_id int, title nvarchar(255), description text, price decimal(10,2), instructor varchar(100), created_at datetime, updated_at datetime, level_name nvarchar(50), register_id int, register_date datetime)
AS
BEGIN
	INSERT INTO @LopHocDangKi(course_id, title, description, price, instructor, created_at, updated_at, level_name, register_id, register_date)
	select c.course_id, c.title, c.description, c.price, c.instructor, c.created_at, c.updated_at, level_name, register_id, register_date
	from register_course r, courses c, level_courses l

	where register_id in (SELECT register_id FROM register_course WHERE user_id = 1) and c.course_id = r.course_id and l.level_id = c.level_id
	RETURN
END