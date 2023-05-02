--- Tạo hàm đắng kí khóa học (tham số: user_id, course_id): dung bảng users, register_course, orders, order_items, 
--mặc định khi đăng kí là chưa thanh toán xem bảng payment_status để dùng id cho hành động chưa thanh toán:
--	+ trả về 1 (int) nếu đúng ngược lại trả về 0 (int).

GO
CREATE OR ALTER PROCEDURE RegisterUserCourse
@user_id int, @course_id int, @quantity int
AS
BEGIN
	DECLARE @order_id int, @register_id int, @item_id int
	SET @order_id =  (SELECT COUNT(order_id) + 1 FROM orders)
	SET @register_id = (SELECT COUNT(register_id) + 1 FROM register_course)
	SET @item_id = (SELECT COUNT(item_id) + 1 FROM order_items)

	--thêm hàng mới vào register_course
	INSERT INTO register_course(register_id, user_id, course_id, register_date)
	VALUES (@register_id, @user_id, @course_id, GETDATE())

	DECLARE @course_price DECIMAL(10,2)
	SET @course_price = (SELECT price FROM courses where course_id = @course_id)

	--thêm hàng mới vào orders
	INSERT INTO orders(order_id, user_id, payment_status_id, order_date, total_amount)
	VALUES(@order_id, @user_id, 1, GETDATE(), @course_price * @quantity)

	--thêm hàng mới vào order_items
	INSERT INTO order_items(item_id, order_id, course_id, price, quantity)
	VALUES(@item_id, @order_id, @course_id, @course_price, @quantity)
END



-- Delete:
--Tạo hàm xóa đăng kí trên (tham số: user_id, course_id): 
GO
CREATE OR ALTER PROCEDURE deleteUserCourseRegistry
@user_id int, @register_id int
AS 
BEGIN
	DELETE FROM register_course WHERE register_id = @register_id and user_id = @user_id --user_id = @user_id lược bỏ cũng đc vì register_id đã là PK
END


--Chỉnh orders payment_status lại là cancelled (4) khi xóa đơn hàng
GO
CREATE OR ALTER PROCEDURE deleteUserOrders
@order_id int
AS 
BEGIN
	UPDATE orders
	SET payment_status_id = 4
	WHERE order_id = @order_id
END

--Hàm của addmin  
go
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

