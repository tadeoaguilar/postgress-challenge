DROP TABLE IF EXISTS Departments,Employees,Titles,Salaries,Dept_emp,Dept_manager;

CREATE TABLE Departments (
    Dept_no VARCHAR(10)   NOT NULL,
    Dept_name VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_no
     )
);

CREATE TABLE Employees (
    Emp_no INTEGER   NOT NULL,
    Emp_title_id VARCHAR(30)   NOT NULL,
    Birth_date DATE   NOT NULL,
    First_name VARCHAR(30)   NOT NULL,
    Last_name VARCHAR(30)   NOT NULL,
    Sex VARCHAR(1)   NOT NULL,
    Hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Titles (
    Title_id VARCHAR(10)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        Title_id
     )
);

CREATE TABLE Salaries (
    Emp_no INTEGER   NOT NULL,
    Salary MONEY   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Dept_emp (
    Emp_no INTEGER   NOT NULL,
    Dept_no VARCHAR(10)   NOT NULL,
    CONSTRAINT pk_Dept_emp PRIMARY KEY (
        Emp_no,Dept_no
     )
);

CREATE TABLE Dept_manager (
    Dept_no VARCHAR(10)   NOT NULL,
    Emp_no INTEGER   NOT NULL,
    CONSTRAINT pk_Dept_manager PRIMARY KEY (
        Dept_no,Emp_no
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_Emp_title_id FOREIGN KEY(Emp_title_id)
REFERENCES Titles (Title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);


