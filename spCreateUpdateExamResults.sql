DELIMITER $$
CREATE PROCEDURE UpdateExamResultsByEmailAndModule(
    IN p_UserEmail VARCHAR(255),
    IN p_ModuleName VARCHAR(255),
    IN p_new_grade VARCHAR(2)
)
BEGIN
    DECLARE v_UserId INT;
    DECLARE v_ModuleId INT;
    
    -- Get the UserId for the given email
	Select tus.GetModuleId(p_ModuleName) into v_ModuleId;
    Select tus.GetUserId(p_UserEmail) into v_UserId;
    
    -- Update the ExamResults table with the new grade
    
    INSERT INTO ExamResults (ModuleId, UserId, Grade)
    VALUES (v_ModuleId, v_UserId, p_new_grade)
    ON DUPLICATE KEY UPDATE Grade = p_new_grade;
END$$
DELIMITER ;


