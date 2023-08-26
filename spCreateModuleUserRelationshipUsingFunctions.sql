DELIMITER $$
CREATE FUNCTION `GetUserId`(p_UserEmail VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_UserId INT;
    SELECT `Id` INTO v_UserId FROM `User` WHERE `Email` = p_UserEmail;
    RETURN v_UserId;
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION `GetModuleId`(p_ModuleName VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_ModuleId INT;
    SELECT `Id` INTO v_ModuleId FROM `Module` WHERE `Name` = p_ModuleName;
    RETURN v_ModuleId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CreateUserModuleRelationship`(
    
    IN p_ModuleName VARCHAR(50),
    IN p_UserEmail VARCHAR(50)
)
BEGIN
    DECLARE v_UserId INT;
    DECLARE v_ModuleId INT;

    -- Insert the new UserModule relationship
    Select tus.GetModuleId(p_ModuleName) into v_ModuleId;
    Select tus.GetUserId(p_UserEmail) into v_UserId;
    
    INSERT INTO `UserModuleTable` (`ModuleId`, `UserId`)
    VALUES (v_ModuleId, v_UserId);
END$$
DELIMITER ;

-- user relationship with module --
CALL CreateUserModuleRelationship('Cyber Security', 'ashely@localhost');
CALL CreateUserModuleRelationship('Cyber Security', 'dhayalan@localhost');
CALL CreateUserModuleRelationship('RIA', 'dhayalan@localhost');
CALL CreateUserModuleRelationship('Data Analytics', 'dhayalan@localhost');
CALL CreateUserModuleRelationship('Cyber Security', 'john@localhost');
CALL CreateUserModuleRelationship('RIA', 'john@localhost');
