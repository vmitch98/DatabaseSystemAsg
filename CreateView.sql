CREATE VIEW ExamResultsView AS
SELECT 
    ExamResults.Id AS ExamResultId,
    User.Id AS UserId,
    User.Name AS UserName,
    User.Email AS UserEmail,
    Module.Id AS ModuleId,
    Module.Name AS ModuleName,
    ExamResults.Grade
FROM 
    ExamResults
    INNER JOIN User ON ExamResults.UserId = User.Id
    INNER JOIN Module ON ExamResults.ModuleId = Module.Id
    INNER JOIN UserModuleTable ON UserModuleTable.ModuleId = Module.Id
    INNER JOIN UserRole ON UserRole.UserId = User.Id
    INNER JOIN Roles on Roles.Id = UserRole.RoleId
WHERE
    (Roles.Role = 'Lecturer'
    AND User.Email = (SELECT CURRENT_USER())) 
    OR (  Roles.Role = 'Student'
    AND User.Email = (SELECT CURRENT_USER())) 
    OR true