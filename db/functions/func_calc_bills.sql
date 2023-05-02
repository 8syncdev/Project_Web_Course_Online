--Tạo hàm tính số lượng khóa học đã đăng kí (tham số: user_id): dùng bảng register_course:
--	+ Trả về int : số lượng khóa đã đăng kí.
GO
CREATE OR ALTER   FUNCTION [dbo].[getNumUserRegisterCourses] (@user_id int)
RETURNS int
AS
BEGIN
	DECLARE @soLopDangKi int
	SET @soLopDangKi = (SELECT COUNT(register_id) FROM register_course WHERE user_id = @user_id)
	RETURN @soLopDangKi
END

-- Tạo hàm tính tiền tổng số lượng khóa học đã đăng kí (tham số: user_id): dùng bảng orders, order_items:
--	+ Trả về  int: tổng số tiền (có thể trả về thêm nếu nghĩ ra cái gì hợp lí).
GO
CREATE OR ALTER   FUNCTION [dbo].[getTotalMoneyUserRegisterCourses] (@user_id int)
RETURNS decimal(10, 2)
AS
BEGIN
	DECLARE @soTienKhoaHocDangKi decimal(10, 2)
	SET @soTienKhoaHocDangKi = (SELECT SUM(B.price * B.quantity) FROM orders A join order_items B on A.user_id = @user_id and A.order_id = B.order_id and (A.payment_status_id = 1 OR A.payment_status_id = 2))
	IF @soTienKhoaHocDangKi is null
		SET @soTienKhoaHocDangKi = 0
	RETURN @soTienKhoaHocDangKi
END
--hàm xử lý kết quả thanh toán t thêm cái parameter @order_id để xác định order nào user muốn thanh toán
GO
CREATE OR ALTER   FUNCTION [dbo].[processTransaction] (@order_id int, @total_amount decimal(10, 2))
--trả về -1 nếu số tiền < 0, khi order_id không tồn tại, hoặc không tìm thấy order_items nào có @order_id
-- 0 nếu số tiền bé hơn tiền cần để thanh toán order
-- 1 nếu số tiền đủ để thanh toán
-- 2 nếu số tiền lớn hơn tiền cần để thanh toán
RETURNS int
AS
BEGIN
	IF(@total_amount <= 0)
		RETURN -1
	IF(@order_id in  (SELECT order_id FROM orders))
		BEGIN
		DECLARE @total_money_needed_for_order decimal(10, 2)
		SET @total_money_needed_for_order = (SELECT SUM(price * quantity) FROM order_items WHERE order_id = @order_id)
		IF(@total_money_needed_for_order is NULL)
			BEGIN
			RETURN -1
			END

		IF(@total_amount = @total_money_needed_for_order)
			BEGIN
			RETURN 1
			END
		IF(@total_amount < @total_money_needed_for_order)
			BEGIN
			RETURN 0
			END
		IF(@total_amount > @total_money_needed_for_order)
			BEGIN
			RETURN 2
			END
		END
	RETURN -1
END