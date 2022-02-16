DROP DATABASE IF EXISTS accountd_db;
CREATE DATABASE accountd_db;
USE accountd_db;

DROP TABLE IF EXISTS accounts_type;

CREATE TABLE accounts_type (
  id int NOT NULL AUTO_INCREMENT,
  Category varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  phone varchar(20) DEFAULT NULL,
  mangerId int DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT manger FOREIGN KEY (mangerId) REFERENCES employees (id)
);


DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
  Code varchar(19) NOT NULL,
  Name varchar(45) NOT NULL,
  Type int DEFAULT NULL,
  PRIMARY KEY (Code),
  UNIQUE KEY Code_UNIQUE (Code),
  UNIQUE KEY Name_UNIQUE (Name),

  CONSTRAINT typef FOREIGN KEY (Type) REFERENCES accounts_type (id)
);

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
  id int NOT NULL AUTO_INCREMENT,
  Debit varchar(19) NOT NULL,
  Credit varchar(19) NOT NULL,
  Amount int NOT NULL,
  Description varchar(250) NOT NULL,
  EmpDo int NOT NULL,
  EmpCommit int DEFAULT NULL,
  DateDo datetime NOT NULL,
  DateCommit datetime DEFAULT NULL,
  PRIMARY KEY (id),

  CONSTRAINT creditf FOREIGN KEY (Credit) REFERENCES accounts (Code),
  CONSTRAINT depitf FOREIGN KEY (Debit) REFERENCES accounts (Code),
  CONSTRAINT empCommitf FOREIGN KEY (EmpCommit) REFERENCES employees (id),
  CONSTRAINT empDof FOREIGN KEY (EmpDo) REFERENCES employees (id)
);

DROP TABLE IF EXISTS support;

CREATE TABLE support (
  transactions_id int NOT NULL,
  support_num int NOT NULL,
  name varchar(150) NOT NULL,
  date datetime NOT NULL,
  PRIMARY KEY (transactions_id,support_num),
  CONSTRAINT transactionsf FOREIGN KEY (transactions_id) REFERENCES transactions (id)
);

show tables;


INSERT INTO accounts_type (id, Category) VALUES ('1', 'المصروفات');
INSERT INTO accounts_type (id, Category) VALUES ('2', 'الدخل');
INSERT INTO accounts_type (id, Category) VALUES ('3', 'الأصول');
INSERT INTO accounts_type (id, Category) VALUES ('4', 'الخصوم');

INSERT INTO accounts (Code, Name, Type) VALUES ('110001', 'رأس المال', '4');
INSERT INTO accounts (Code, Name, Type) VALUES ('631001', 'الصندوق', '3');
INSERT INTO accounts (Code, Name, Type) VALUES ('632001', 'البنك', '3');
INSERT INTO accounts (Code, Name, Type) VALUES ('711001', 'المشتريات', '1');
INSERT INTO accounts (Code, Name, Type) VALUES ('712002', 'الإيجار', '1');
INSERT INTO accounts (Code, Name, Type) VALUES ('711011', 'النقل', '1');



INSERT INTO employees ( name, phone) VALUES ('زياد عبدالله', '774545436');
INSERT INTO employees ( name, phone,mangerId) VALUES ('محمد علي', '774545436',1);
INSERT INTO employees ( name, phone) VALUES ('عبدالله محمد', '774545436');
INSERT INTO employees ( name, phone,mangerId) VALUES ('أسماعيل محمود', '774545436',1);


