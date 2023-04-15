CREATE OR ALTER FUNCTION getUserRegisteredCourses (@user_id int)
RETURNS @LopHocDangKi TABLE (course_id int, level_id int, title nvarchar(50), description nvarchar(50), price nvarchar(50), instructor nvarchar(50), created_at datetime, updated_at datetime)
AS
BEGIN
	INSERT INTO @LopHocDangKi(course_id, level_id, title, description, price, instructor, created_at, updated_at)
	SELECT *
	FROM courses
	WHERE course_id in (SELECT course_id FROM register_course WHERE user_id = @user_id)
	RETURN
END