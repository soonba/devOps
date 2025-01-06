CREATE USER 'slave_access'@'%' identified BY 'custompassword';
GRANT replication slave ON *.* TO 'slave_access'@'%' WITH GRANT OPTION;

CREATE USER 'seonba'@'172.%' identified BY 'custompassword';
CREATE USER 'seonba'@'192.%' identified BY 'custompassword';
GRANT ALL PRIVILEGES ON *.* TO 'seonba'@'172.%';
GRANT ALL PRIVILEGES ON *.* TO 'seonba'@'192.%';

flush PRIVILEGES;
