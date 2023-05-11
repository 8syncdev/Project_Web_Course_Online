CREATE FUNCTION HasWallet(@user_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @has_wallet INT;

    SELECT @has_wallet = CASE WHEN EXISTS (SELECT 1 FROM budget WHERE user_id = @user_id) THEN 1 ELSE 0 END;

    RETURN @has_wallet;
END


CREATE FUNCTION AddFunds(@user_id INT, @amount DECIMAL(10, 2))
RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    BEGIN TRY
        -- Bắt đầu transaction
        BEGIN TRANSACTION;

        -- Kiểm tra sự tồn tại của người dùng
        IF EXISTS (SELECT 1 FROM users WHERE user_id = @user_id)
        BEGIN
            -- Cộng thêm số tiền vào ví của người dùng
            UPDATE budget
            SET amount = amount + @amount
            WHERE user_id = @user_id;

            SET @result = 1; -- Nạp tiền thành công
        END
        ELSE
        BEGIN
            SET @result = 0; -- Người dùng không tồn tại
        END

        -- Commit transaction nếu không có lỗi
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Rollback transaction nếu có lỗi
        ROLLBACK;

        -- Đánh dấu lỗi trong biến @result
        SET @result = -1; -- Lỗi trong quá trình thực hiện giao dịch
    END CATCH;

    RETURN @result;
END

