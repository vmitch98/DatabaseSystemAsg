CREATE USER 'ashely'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON tus.examresultsview TO 'ashely'@'localhost';
GRANT EXECUTE ON PROCEDURE tus.UpdateExamResultsByEmailAndModule TO 'ashely'@'localhost';
FLUSH PRIVILEGES;