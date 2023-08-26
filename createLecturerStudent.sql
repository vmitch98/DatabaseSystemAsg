CREATE USER 'dhayalan'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON tus.examresultsview TO 'dhayalan'@'localhost';
FLUSH PRIVILEGES;