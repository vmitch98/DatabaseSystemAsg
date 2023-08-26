DELIMITER $$
CREATE PROCEDURE `CreateUserWithRole`(
    IN p_Name VARCHAR(50),
    IN p_Email VARCHAR(50),
    IN p_Role VARCHAR(50)
)
BEGIN
    DECLARE v_RoleId INT;
    DECLARE v_UserId INT;
    
    -- Get the RoleId for the specified role
    SELECT Id INTO v_RoleId FROM `Roles` WHERE `Role` = p_Role;
    
    -- Insert the new user into the User table
    INSERT INTO `User` (`Name`, `Email`)
    VALUES (p_Name, p_Email);
    
    -- Get the UserId for the newly created user
    
    SELECT LAST_INSERT_ID() INTO v_UserId;
    
    -- Insert the user's role into the UserRole table
    INSERT INTO `UserRole` (`UserId`, `RoleId`)
    VALUES (v_UserId, v_RoleId);
END$$
DELIMITER ;

CALL CreateUserWithRole('Administrator', 'admin@localhost', 'Administrator');
CALL CreateUserWithRole('Ashley', 'ashely@localhost', 'Lecturer');
CALL CreateUserWithRole('Dhayalan', 'dhayalan@localhost', 'Student');
CALL CreateUserWithRole('John', 'john@localhost', 'Student');