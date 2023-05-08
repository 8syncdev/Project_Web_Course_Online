CREATE PROCEDURE check_login 
    @username VARCHAR(50),
    @password VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @user_id INT, @role_id INT;

    -- Check if the user exists
    SELECT @user_id = user_id
    FROM users
    WHERE username = @username AND password = @password;

    IF @user_id IS NOT NULL
    BEGIN
        -- Check if the user is an admin
        SELECT @role_id = role_id
        FROM users_roles
        WHERE user_id = @user_id AND role_id = 1;

        IF @role_id IS NOT NULL
        BEGIN
            -- User is an admin
            SELECT 1 AS result;
        END
        ELSE
        BEGIN
            -- User is a regular user
            SELECT 2 AS result;
        END
    END
    ELSE
    BEGIN
        -- User is invalid
        SELECT 0 AS result;
    END
END