CREATE database PM;

CREATE TABLE PM.PROJECT (
    ProjectID INT NOT NULL AUTO_INCREMENT,
    ProjectName VARCHAR(50) NOT NULL,
    Department VARCHAR(35) NOT NULL,
    MaxHours NUMERIC(8, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    CONSTRAINT ProjectPK PRIMARY KEY (ProjectID)
);
SET @@auto_increment_increment=100;
ALTER TABLE PM.PROJECT AUTO_INCREMENT = 1000;

INSERT INTO PM.PROJECT (ProjectName, Department, MaxHours, StartDate, EndDate) VALUES
('Project A', 'Engineering', 80, '2024-04-01', '2024-06-30'),
('Project B', 'Marketing', 60, '2024-04-05', '2024-07-31'),
('Project C', 'Human Resources', 50, '2024-04-10', '2024-08-15'),
('Project D', 'Finance', 70, '2024-04-15', NULL),
('Project E', 'Information Technology', 90, '2024-04-20', '2024-09-30'),
('Project F', 'Sales', 65, '2024-04-25', '2024-10-31'),
('Project G', 'Operations', 55, '2024-05-01', NULL),
('Project H', 'Customer Service', 75, '2024-05-05', NULL),
('Project I', 'Research and Development', 85, '2024-05-10', '2024-12-31'),
('Project J', 'Legal', 45, '2024-05-15', NULL),
('Project K', 'Quality Assurance', 80, '2024-05-20', '2024-11-30'),
('Project L', 'Purchasing', 60, '2024-05-25', '2024-10-15'),
('Project M', 'Production', 70, '2024-06-01', NULL),
('Project N', 'Training', 50, '2024-06-05', '2024-09-15'),
('Project O', 'Accounting', 90, '2024-06-10', '2024-12-31'),
('Project P', 'Public Relations', 65, '2024-06-15', NULL),
('Project Q', 'Administration', 55, '2024-06-20', '2024-11-30'),
('Project R', 'Logistics', 75, '2024-06-25', '2024-10-31'),
('Project S', 'Facilities Management', 85, '2024-07-01', '2024-12-15'),
('Project T', 'Supply Chain', 45, '2024-07-05', '2024-09-30');

CREATE TABLE DEPARTMENT (
DepartmentName	Varchar(35)	NOT NULL,
BudgetCode	VarChar(30)	NOT NULL,
OfficeNumber	Varchar(15)	NOT NULL,
DepartmentPhone	VarChar(12)	NOT NULL,
CONSTRAINT DEPARTMENT_PK PRIMARY KEY(DepartmentName)
);




CREATE TABLE EMPLOYEE (
EmployeeNumber	Int	NOT NULL	IDENTITY(1, 1),
FirstName	Varchar(25)	NOT NULL,
LastName	VarChar(25)	NOT NULL,
Department	VarChar(35)	NOT NULL,
Position	VarChar(35)	NULL,
OfficePhone	Char(12)	NULL,
EmailAddress	VarChar(100)	NOT NULL,
CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EmployeeNumber),
CONSTRAINT EMP_DEPART_FK FOREIGN KEY (Department)
REFERENCES DEPARTMENT (DepartmentName)
);

CREATE TABLE PROJECT (
ProjectID	Int	NOT NULL IDENTITY(1000, 100),
ProjectName	VarChar(50)	NOT NULL,
Department	VarChar(35)	NOT NULL,
MaxHours	Numeric(8,2)	NOT NULL,
StartDate	Date	NOT NULL,
EndDate	Date	NULL,
CONSTRAINT	PROJECT_PK	PRIMARY KEY (ProjectID),
CONSTRAINT	PROJ_DEPART_FK	FOREIGN KEY(Department)
REFERENCES DEPARTMENT (DepartmentName)
);

CREATE TABLE ASSIGNMENT (
ProjectID	Int	NOT NULL,
EmployeeNumber	Int	NOT NULL,
HoursWorked	Numeric(6,2)	NULL,
CONSTRAINT	ASSIGNMENT_PK PRIMARY KEY	(ProjectID, EmployeeNumber),
CONSTRAINT	ASSIGN_PROJ_FK	FOREIGN KEY (ProjectID)
REFERENCES PROJECT (ProjectID),
CONSTRAINT	ASSIGN_EMP_FK FOREIGN KEY (EmployeeNumber)
REFERENCES EMPLOYEE (EmployeeNumber)
);

