-- Library Management System Project 2

drop table if exists branch;
create table branch
     (    branch_id varchar(10) primary key,
	      manager_id varchar(10),
		  branch_address varchar(55),
		  contact_no varchar(15)
     );
	 

drop table if exists employee;
create table employee
     (    emp_id varchar(10) primary key,
	      emp_name varchar(25),
		  position varchar(25),
		  salary int,
		  branch_id varchar(25)   --FK
	 );

drop table if exists books;
create table books
     (   isbn varchar(20) primary key,
	     book_title varhar(75),
		 category varchar(25),
		 rental_price float,
		 status	varchar(15),
		 author varchar(35),
		 publisher varchar(55)
	 );

drop table if exists members;
create table members
     (   member_id varchar(10) primary key,
	     member_name varchar(25),
		 member_address varchar(75),
		 reg_date date
	 );

drop table if exists issued_status;
create table issued_status
     (   issued_id varchar(10) primary key,
	     issued_member_id varchar(10), --FK
		 issued_book_name varchar(75),
		 issued_date date,
		 issued_book_isbn varchar(25),  --FK
		 issued_emp_id varchar(10)   --FK
	 );

drop table if exists return_status;
create table return_status
     (   return_id varchar(10) primary key,
	     issued_id varchar(10),
		 return_book_name varchar(75),
		 return_date date,
		 return_book_isbn varchar(25)
	 );

-- foreign key --
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employee(emp_id);

ALTER TABLE employee
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);










