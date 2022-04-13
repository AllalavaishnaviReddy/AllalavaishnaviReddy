CREATE DATABASE fee_charges;
USE fee_charges;
-- tables
-- Table: Charges
CREATE TABLE Charges (
    charge_id int NOT NULL,
    charge_type varchar(100) NOT NULL,
    charge_amount decimal(8,2) NOT NULL,
    CONSTRAINT Charges_pk PRIMARY KEY (charge_id)
);

-- Table: Increment
CREATE TABLE Increment (
    Increment_id int NOT NULL,
    Increment_type varchar(100) NOT NULL,
    Increment_amount decimal(8,2) NOT NULL,
    CONSTRAINT Increment_pk PRIMARY KEY (Increment_id)
);

-- Table: Payment
CREATE TABLE Payment (
    Payment_id int NOT NULL,
    charge_id int NOT NULL,
    Date date NOT NULL,
    Amount decimal(8,2) NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (Payment_id)
);

-- Table: Student
CREATE TABLE Student (
    Student_id int NOT NULL,
    Name varchar(100) NOT NULL,
    Age int NOT NULL,
    Address varchar(100) NOT NULL,
    CONSTRAINT Student_pk PRIMARY KEY (Student_id)
);

-- Table: StudentCharge
CREATE TABLE StudentCharge (
    StudentCharge_id int NOT NULL,
    Student_id int NOT NULL,
    Charge_id int NOT NULL,
    Increment_id int NOT NULL,
    Amount decimal(8,2) NOT NULL,
    Charge_name varchar(100) NOT NULL,
    CONSTRAINT StudentCharge_pk PRIMARY KEY (StudentCharge_id)
);

-- foreign keys
-- Reference: Payment_Charges (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Charges FOREIGN KEY Payment_Charges (charge_id)
    REFERENCES Charges (charge_id);

-- Reference: StudentCharge_Charges (table: StudentCharge)
ALTER TABLE StudentCharge ADD CONSTRAINT StudentCharge_Charges FOREIGN KEY StudentCharge_Charges (charge_id)
    REFERENCES Charges (charge_id);

-- Reference: StudentCharge_Increment (table: StudentCharge)
ALTER TABLE StudentCharge ADD CONSTRAINT StudentCharge_Increment FOREIGN KEY StudentCharge_Increment (Increment_id)
    REFERENCES Increment (Increment_id);


-- Reference: StudentCharge_Student (table: StudentCharge)
ALTER TABLE StudentCharge ADD CONSTRAINT StudentCharge_Student FOREIGN KEY StudentCharge_Student (Student_id)
    REFERENCES Student (Student_id);

ALTER TABLE payment
MODIFY COLUMN Date VARCHAR(20);
-- End of file.

