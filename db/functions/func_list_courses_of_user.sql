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

-- TU DAY CHUA CHECK
-- Kiem tra khoa hoc va level co ton tai: 
CREATE FUNCTION check_level_and_category_exists
(
    @level_id INT,
    @category_id INT
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT = 0;

    IF EXISTS (SELECT 1 FROM level_courses WHERE level_id = @level_id) AND
       EXISTS (SELECT 1 FROM categories WHERE category_id = @category_id)
        SET @result = 1; -- Trả về 1 nếu cả level_id và category_id tồn tại

    RETURN @result;
END
go
-- hàm thêm khi Thêm khóa học: mà dữ liệu đã đc kiểm tra
CREATE OR ALTER PROCEDURE post_course
    @title VARCHAR(255),
    @description TEXT,
    @price DECIMAL(10,2),
    @instructor VARCHAR(100),
    @level_id INT,
    @category_id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra xem level_id có tồn tại trong bảng level_courses không
    IF dbo.check_level_and_category_exists(@level_id, @category_id) = 0
    BEGIN
        RAISERROR('Level not found', 16, 1);
        RETURN 0; -- Trả về 0 nếu không tìm thấy level và category hợp lệ 
    END

    -- Thực hiện chèn dữ liệu vào bảng courses
    INSERT INTO courses (title, description, price, instructor, created_at, level_id)
    VALUES (@title, @description, @price, @instructor, GETDATE(), @level_id);

    RETURN 1; -- Trả về 1 nếu chèn dữ liệu thành công
END