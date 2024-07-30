show databases;
create database project;
use mysql;
use db_project;

create table EMP_LOGIN
(
	username varchar(100),
	user_password varchar(100)
	
);


CREATE TABLE Customer (
    CustomerID INT ,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    GENDER VARCHAR(50),
    DOB  VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

ALTER TABLE Customer
ADD CONSTRAINT customer_pk PRIMARY KEY (CustomerID);


CREATE TABLE Account (
    AccountID INT ,
    AccountNumber VARCHAR(20),
    Type VARCHAR(20),
    Balance DECIMAL(10, 2),
    CustomerID INT
);

ALTER TABLE Account
ADD CONSTRAINT account_pk PRIMARY KEY (AccountID);

ALTER TABLE Account ADD CONSTRAINT FK_Account_Customer FOREIGN KEY (CustomerID) 
REFERENCES Customer(CustomerID);




CREATE TABLE Transaction (
    TransactionID INT ,
    T_Date DATE,
    Amount DECIMAL(10, 2),
    Type VARCHAR(20),
    AccountID INT
    
);

ALTER TABLE Transaction
ADD CONSTRAINT t_pk PRIMARY KEY (TransactionID);

-- Adding foreign key for AccountID
ALTER TABLE Transaction ADD CONSTRAINT FK_Transactions_Account FOREIGN KEY (AccountID) 
REFERENCES Account(AccountID);

-- Adding foreign key for OtherAccountID
-- ALTER TABLE TransactionsADD CONSTRAINT FK_Transactions_OtherAccount FOREIGN KEY (OtherAccountID) 
-- REFERENCES Account(AccountID);





CREATE TABLE Employee (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50)
);

ALTER TABLE Employee
ADD CONSTRAINT employee_pk PRIMARY KEY (EmployeeID);





CREATE TABLE Branch (
    BranchID INT ,
    Location VARCHAR(100),
    ManagerID INT
);

ALTER TABLE Branch
ADD CONSTRAINT branch_pk PRIMARY KEY (BranchID);

-- Adding foreign key for ManagerID
ALTER TABLE Branch
ADD CONSTRAINT FK_Projects_Manager FOREIGN KEY (ManagerID)  REFERENCES Employee(EmployeeID);



CREATE TABLE Loan (
    LoanID INT ,
    Amount DECIMAL(10, 2),
    Type VARCHAR(50),
    InterestRate DECIMAL(5, 2),
    CustomerID INT
);

ALTER TABLE Loan
ADD CONSTRAINT loan_pk PRIMARY KEY (LoanID);


ALTER TABLE Loan
ADD CONSTRAINT FK_Loan_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);



CREATE TABLE Beneficiary (
    BeneficiaryID INT ,
    Name VARCHAR(100),
    AccountNumber VARCHAR(20),
    CustomerID INT
    
);

ALTER TABLE Beneficiary
ADD CONSTRAINT beneficiary_pk PRIMARY KEY (BeneficiaryID);

-- Adding foreign key for CustomerID to a different table
ALTER TABLE Beneficiary ADD CONSTRAINT FK_Beneficiary_Customer FOREIGN KEY (CustomerID) 
REFERENCES Customer(CustomerID);



CREATE TABLE CustomerContact (
    ContactID INT ,
    CustomerID INT,
    ContactMethod VARCHAR(50),
    ContactValue VARCHAR(255)
);

ALTER TABLE CustomerContact
ADD CONSTRAINT customercontact_pk PRIMARY KEY (ContactID);

ALTER TABLE CustomerContact add constraint fK_customer_contact FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);


------------------------------------------------------------------------------------------------
-- 3nf karna hai isko
 
CREATE TABLE Card (
    CardNumber VARCHAR(16) ,
    ExpiryDate DATE,
    CVV VARCHAR(3),
    Type VARCHAR(20), -- Assuming the type can be 'silver', 'gold', 'platinum', etc.
    CustomerID INT,
    CONSTRAINT FK_Card_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
------------------------------------------------------------------------------------------

ALTER TABLE Card ADD CONSTRAINT card_pk PRIMARY KEY (CardNumber);

-- Adding foreign key for CustomerID to a different table
/*
ALTER TABLE Card  ADD CONSTRAINT FK_Card_Customer FOREIGN KEY (CustomerID) 
REFERENCES Customer(CustomerID);
*/

CREATE TABLE CEO(
    CEOHistoryID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    PreviousCompany VARCHAR(100),
    PreviousPosition VARCHAR(50),
    CurrentPositionInBank VARCHAR(50),
    DateAppointed DATE
);



CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    CustomerID INT,
    FeedbackText TEXT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    Timestamp TIMESTAMP
);


CREATE TABLE BankAchievements (
    AchievementID INT PRIMARY KEY,
    AchievementName VARCHAR(100),
    Description TEXT,
    DateAchieved DATE
);

---------------------------------------------------------------------------------------------------------------------------
                                                             -- drop tables 

/*
DROP TABLE branch;
DROP TABLE employee;
DROP TABLE transaction;
DROP TABLE account;
DROP TABLE BENEFICIARY;
DROP TABLE LOAN;
DROP TABLE card;
DROP TABLE customercontact;
DROP TABLE customer;
*/

-- Inserting data into the Customer table
INSERT INTO Customer (CustomerID, FirstName, LastName, GENDER, DOB, Email, Phone, Address)
VALUES (1, 'Abdullah', 'Lastname1', 'Male', '1990-01-01', 'abdullah@example.com', '1234567890', 'Address1');

INSERT INTO Customer (CustomerID, FirstName, LastName, GENDER, DOB, Email, Phone, Address)
VALUES (2, 'Ghani', 'Lastname2', 'Male', '1985-05-05', 'ghani@example.com', '9876543210', 'Address2');

INSERT INTO Customer (CustomerID, FirstName, LastName, GENDER, DOB, Email, Phone, Address)
VALUES (3, 'Azeem', 'Lastname3', 'Male', '1980-10-10', 'azeem@example.com', '5678901234', 'Address3');

INSERT INTO Customer (CustomerID, FirstName, LastName, GENDER, DOB, Email, Phone, Address)
VALUES (4, 'Sami', 'Lastname4', 'Male', '1995-03-15', 'sami@example.com', '6789012345', 'Address4');

INSERT INTO Customer (CustomerID, FirstName, LastName, GENDER, DOB, Email, Phone, Address)
VALUES (5, 'Another', 'Lastname5', 'Female', '1992-07-20', 'another@example.com', '8765432109', 'Address5');

-- select * from Customer;



-- Inserting data into the Account table
INSERT INTO Account (AccountID, AccountNumber, Type, Balance, CustomerID)
VALUES (1, 'A123456789', 'Savings', 5000.00, 1);

INSERT INTO Account (AccountID, AccountNumber, Type, Balance, CustomerID)
VALUES (2, 'C987654321', 'Checking', 2500.50, 2);

INSERT INTO Account (AccountID, AccountNumber, Type, Balance, CustomerID)
VALUES (3, 'S111111111', 'Savings', 10000.00, 3);

INSERT INTO Account (AccountID, AccountNumber, Type, Balance, CustomerID)
VALUES (4, 'C222222222', 'Checking', 7500.75, 4);

INSERT INTO Account (AccountID, AccountNumber, Type, Balance, CustomerID)
VALUES (5, 'S333333333', 'Savings', 12000.00, 5);

-- select *from Account;


--
-- Inserting data into the Transaction table
-- Inserting data into the Transaction table
INSERT INTO Transaction (TransactionID, T_Date, Amount, Type, AccountID)
VALUES (1, STR_TO_DATE('2023-01-01', '%Y-%m-%d'), 1000.00, 'Deposit', 1);

INSERT INTO Transaction (TransactionID, T_Date, Amount, Type, AccountID)
VALUES (2, STR_TO_DATE('2023-01-02', '%Y-%m-%d'), 500.50, 'Withdrawal', 3);

INSERT INTO Transaction (TransactionID, T_Date, Amount, Type, AccountID)
VALUES (3, STR_TO_DATE('2023-01-03', '%Y-%m-%d'), 1500.25, 'Transfer', 2);

INSERT INTO Transaction (TransactionID, T_Date, Amount, Type, AccountID)
VALUES (4, STR_TO_DATE('2023-01-04', '%Y-%m-%d'), 200.00, 'Withdrawal', 4);

INSERT INTO Transaction (TransactionID, T_Date, Amount, Type, AccountID)
VALUES (5, STR_TO_DATE('2023-01-05', '%Y-%m-%d'), 800.75, 'Deposit', 5);

-- select * from transaction;


-- Inserting data into the Employee table
INSERT INTO Employee (EmployeeID, FirstName, LastName, Position)
VALUES (1, 'John', 'Doe', 'Branch Manager');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Position)
VALUES (2, 'Jane', 'Smith', 'Teller');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Position)
VALUES (3, 'Alex', 'Johnson', 'Customer Service Representative');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Position)
VALUES (4, 'Emily', 'Brown', 'Loan Officer');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Position)
VALUES (5, 'Michael', 'Davis', 'Financial Advisor');

-- select * from employee;

--
-- Inserting data into the Branch table
INSERT INTO Branch (BranchID, Location, ManagerID)
VALUES (1, 'Downtown', 1);

INSERT INTO Branch (BranchID, Location, ManagerID)
VALUES (2, 'Suburb', 2);

INSERT INTO Branch (BranchID, Location, ManagerID)
VALUES (3, 'City Center', 3);

INSERT INTO Branch (BranchID, Location, ManagerID)
VALUES (4, 'Business District', 4);

INSERT INTO Branch (BranchID, Location, ManagerID)
VALUES (5, 'Industrial Zone', 5);

-- select * from branch;


--
-- Inserting data into the Loan table
INSERT INTO Loan (LoanID, Amount, Type, InterestRate, CustomerID)
VALUES (1, 5000.00, 'Personal Loan', 8.5, 1);

INSERT INTO Loan (LoanID, Amount, Type, InterestRate, CustomerID)
VALUES (2, 10000.00, 'Home Loan', 6.2, 2);

INSERT INTO Loan (LoanID, Amount, Type, InterestRate, CustomerID)
VALUES (3, 7500.50, 'Car Loan', 7.0, 3);

INSERT INTO Loan (LoanID, Amount, Type, InterestRate, CustomerID)
VALUES (4, 12000.75, 'Education Loan', 5.8, 4);

INSERT INTO Loan (LoanID, Amount, Type, InterestRate, CustomerID)
VALUES (5, 8000.25, 'Business Loan', 9.3, 5);

-- select * from loan ;


--
-- Inserting data into the Beneficiary table
INSERT INTO Beneficiary (BeneficiaryID, Name, AccountNumber, CustomerID)
VALUES (1, 'Friend 1', 'A123456789', 1);

INSERT INTO Beneficiary (BeneficiaryID, Name, AccountNumber, CustomerID)
VALUES (2, 'Family Member 1', 'C987654321', 2);

INSERT INTO Beneficiary (BeneficiaryID, Name, AccountNumber, CustomerID)
VALUES (3, 'Business Partner 1', 'S111111111', 3);

INSERT INTO Beneficiary (BeneficiaryID, Name, AccountNumber, CustomerID)
VALUES (4, 'Charity Organization', 'C222222222', 4);

INSERT INTO Beneficiary (BeneficiaryID, Name, AccountNumber, CustomerID)
VALUES (5, 'Friend 2', 'S333333333', 5);



--
-- Inserting data into the CustomerContact table
INSERT INTO CustomerContact (ContactID, CustomerID, ContactMethod, ContactValue)
VALUES (1, 1, 'Email', 'abdullah@example.com');

INSERT INTO CustomerContact (ContactID, CustomerID, ContactMethod, ContactValue)
VALUES (2, 2, 'Phone', '9876543210');

INSERT INTO CustomerContact (ContactID, CustomerID, ContactMethod, ContactValue)
VALUES (3, 3, 'Email', 'azeem@example.com');

INSERT INTO CustomerContact (ContactID, CustomerID, ContactMethod, ContactValue)
VALUES (4, 4, 'Phone', '6789012345');

INSERT INTO CustomerContact (ContactID, CustomerID, ContactMethod, ContactValue)
VALUES (5, 5, 'Email', 'another@example.com');


--
-- Inserting data into the Card table
INSERT INTO Card ( CardNumber, ExpiryDate, CVV, Type, CustomerID)
VALUES ( '1234567890123456', '2024-12-01', '123', 'silver', 1);

INSERT INTO Card ( CardNumber, ExpiryDate, CVV, Type, CustomerID)
VALUES ( '9876543210987654', '2023-08-01', '456', 'gold', 2);

INSERT INTO Card ( CardNumber, ExpiryDate, CVV, Type, CustomerID)
VALUES ( '1111222233334444', '2025-05-01', '789', 'platinum', 3);

INSERT INTO Card ( CardNumber, ExpiryDate, CVV, Type, CustomerID)
VALUES ( '2222333344445555', '2024-10-01', '234', 'silver', 4);

INSERT INTO Card ( CardNumber, ExpiryDate, CVV, Type, CustomerID)
VALUES ( '3333444455556666', '2023-11-01', '567', 'gold', 5);



-- Inserting into CEO table (Abdullah)
INSERT INTO CEO (CEOHistoryID, FirstName, PreviousCompany, PreviousPosition, CurrentPositionInBank, DateAppointed)
VALUES (1, 'Abdullah', 'ABC Corp', 'CEO', 'CEO', '2022-01-01');

-- Inserting into CEO table (Ghani)
INSERT INTO CEO (CEOHistoryID, FirstName, PreviousCompany, PreviousPosition, CurrentPositionInBank, DateAppointed)
VALUES (2, 'Ghani', 'XYZ Inc', 'COO', 'CEO', '2022-02-15');

-- Inserting into CEO table (Azeem)
INSERT INTO CEO (CEOHistoryID, FirstName, PreviousCompany, PreviousPosition, CurrentPositionInBank, DateAppointed)
VALUES (3, 'Azeem', '123 Ltd', 'CFO', 'CEO', '2022-03-20');

-- Inserting into CEO table (Abdullah again)
INSERT INTO CEO (CEOHistoryID, FirstName, PreviousCompany, PreviousPosition, CurrentPositionInBank, DateAppointed)
VALUES (4, 'Abdullah', '456 Co', 'VP Finance', 'CEO', '2022-04-10');

-- Inserting into CEO table (Ghani again)
INSERT INTO CEO (CEOHistoryID, FirstName, PreviousCompany, PreviousPosition, CurrentPositionInBank, DateAppointed)
VALUES (5, 'Ghani', '789 Enterprises', 'Director', 'CEO', '2022-05-05');




-- Inserting into Feedback table (FeedbackID 1)
INSERT INTO Feedback (FeedbackID, CustomerID, FeedbackText, Rating, Timestamp)
VALUES (1, 101, 'Great service!', 5, CURRENT_TIMESTAMP);

-- Inserting into Feedback table (FeedbackID 2)
INSERT INTO Feedback (FeedbackID, CustomerID, FeedbackText, Rating, Timestamp)
VALUES (2, 102, 'Prompt response to my queries.', 4, CURRENT_TIMESTAMP);

-- Inserting into Feedback table (FeedbackID 3)
INSERT INTO Feedback (FeedbackID, CustomerID, FeedbackText, Rating, Timestamp)
VALUES (3, 103, 'Could improve on response time.', 3, CURRENT_TIMESTAMP);

-- Inserting into Feedback table (FeedbackID 4)
INSERT INTO Feedback (FeedbackID, CustomerID, FeedbackText, Rating, Timestamp)
VALUES (4, 104, 'Excellent experience with the staff.', 5, CURRENT_TIMESTAMP);

-- Inserting into Feedback table (FeedbackID 5)
INSERT INTO Feedback (FeedbackID, CustomerID, FeedbackText, Rating, Timestamp)
VALUES (5, 105, 'Satisfied with the overall service.', 4, CURRENT_TIMESTAMP);




-- Inserting into BankAchievements table (AchievementID 1)
INSERT INTO BankAchievements (AchievementID, AchievementName, Description, DateAchieved)
VALUES (1, 'Customer Satisfaction Award', 'Awarded for outstanding customer service.', '2022-06-01');

-- Inserting into BankAchievements table (AchievementID 2)
INSERT INTO BankAchievements (AchievementID, AchievementName, Description, DateAchieved)
VALUES (2, 'Financial Excellence Recognition', 'Recognized for achieving financial goals.', '2022-07-15');

-- Inserting into BankAchievements table (AchievementID 3)
INSERT INTO BankAchievements (AchievementID, AchievementName, Description, DateAchieved)
VALUES (3, 'Innovation Award', 'Acknowledged for innovative banking solutions.', '2022-08-20');

-- Inserting into BankAchievements table (AchievementID 4)
INSERT INTO BankAchievements (AchievementID, AchievementName, Description, DateAchieved)
VALUES (4, 'Community Impact Award', 'Received for positive contributions to the community.', '2022-09-10');

-- Inserting into BankAchievements table (AchievementID 5)
INSERT INTO BankAchievements (AchievementID, AchievementName, Description, DateAchieved)
VALUES (5, 'Employee Appreciation Award', 'Awarded for fostering a positive work environment.', '2022-10-05');




-- -------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------
											-- updation
-- Update the email address of a specific customer
UPDATE Customer
SET Email = 'newemail@example.com'
WHERE CustomerID = 1;

-- Increase the balance of a specific account
UPDATE Account
SET Balance = Balance + 1000.00
WHERE AccountID = 2;

-- Change the position of an employee
UPDATE Employee
SET Position = 'Senior Manager'
WHERE EmployeeID = 2;

--------------------------------------------------------------------------------------------------------------------------

                                                     -- deletion

---------------------------------------------------------------------------------------------------------------------------

                                                     -- transaction       
                                                     
   -- Sample SQL statements within the transaction

-- Start a transaction
START TRANSACTION;

-- Inserting a new customer
INSERT INTO Customer (CustomerID, FirstName, LastName, Gender, DOB, Email, Phone, Address)
VALUES (1, 'John', 'Doe', 'Male', '1990-01-01', 'john.doe@example.com', '1234567890', '123 Main St');

-- Inserting a new account for the customer
INSERT INTO Account (AccountID, AccountNumber, Type, Balance, CustomerID)
VALUES (1, '123456789', 'Savings', 1000.00, 1);

-- Inserting a new transaction
INSERT INTO Transaction (TransactionID, T_Date, Amount, Type, AccountID, OtherAccountID)
VALUES (1, CURRENT_DATE(), 100.00, 'Deposit', 1, NULL);

-- Sample additional statements...

-- Commit the transaction if everything is successful
COMMIT;

-- If an error occurs, roll back the transaction
-- Note: MySQL automatically rolls back the transaction on error


---------------------------------------------------------------------------------------------------------------------------
                                                     -- joins
SELECT *
FROM Customer c
JOIN Account a ON c.CustomerID = a.CustomerID;


SELECT *
FROM Transaction t
JOIN Account a ON t.AccountID = a.AccountID;



SELECT *
FROM Employee e
JOIN Branch b ON e.EmployeeID = b.ManagerID;


SELECT *
FROM Loan l
JOIN Customer c ON l.CustomerID = c.CustomerID;


SELECT *
FROM CustomerContact cc
JOIN Customer c ON cc.CustomerID = c.CustomerID;



select * from customer;
select * from Account ;
select * from loan;

------------------------------------------------------------------------------------------------------------------------------
                                                     -- triggers
-- Trigger 1: Update balance after a deposit
DELIMITER //
CREATE TRIGGER deposit_balance
AFTER INSERT ON Transaction 
FOR EACH ROW 
BEGIN
    DECLARE a_id INT;
    DECLARE balance DECIMAL(10, 2);

    SET a_id = NEW.AccountID;
    SET balance = NEW.Amount;

    UPDATE Account
    SET Balance = Balance + balance
    WHERE AccountID = a_id;
END //
DELIMITER ;

-- Trigger 2: Update balance after a withdrawal
DELIMITER //
CREATE TRIGGER withdraw_balance
AFTER INSERT ON Transaction 
FOR EACH ROW 
BEGIN
    DECLARE a_id INT;
    DECLARE balance DECIMAL(10, 2);

    SET a_id = NEW.AccountID;
    SET balance = NEW.Amount;

    UPDATE Account
    SET Balance = Balance - balance
    WHERE AccountID = a_id;
END //
DELIMITER ;


-- ---------------------------------------------------------------------------------------------------------------------------

                                                                    -- functions

-- Function 1: Get current amount
DELIMITER //
CREATE FUNCTION get_current_amount(a_id INT) RETURNS DECIMAL(20, 2)
BEGIN
    DECLARE current_amount DECIMAL(20, 2);
    SELECT Balance INTO current_amount FROM Account WHERE AccountID = a_id;
    RETURN current_amount;
END //
DELIMITER ;

-- Function 2: Get transactions
DELIMITER //
CREATE PROCEDURE get_transactions(a_id INT)
BEGIN
    SELECT TRANSACTION_ID, BRANCH_ID, DATE_OF_TRANSACTION, AMOUNT, ACTION
    FROM Transaction
    WHERE AccountID = a_id
    ORDER BY DATE_OF_TRANSACTION DESC;
END //
DELIMITER ;

-- Function 3: Employee login
DELIMITER //
CREATE PROCEDURE e_login(IN f_name VARCHAR(255), IN f_password VARCHAR(255))
BEGIN
    SELECT USERNAME, U_PASSWORD
    FROM EMP_LOGIN
    WHERE USERNAME = f_name AND U_PASSWORD = f_password;
END //
DELIMITER ;

-- Function 4: Customer information
DELIMITER //
CREATE PROCEDURE customer_info(IN a_id INT)
BEGIN
    SELECT c.name, ac.PHONE
    FROM Account ac
    JOIN Customer c ON ac.CustomerID = c.CustomerID
    WHERE ac.AccountID = a_id;
END //
DELIMITER ;

------------------------------------------------------------------------------------------------------------------------------
                                                        -- procedures


-- Procedure: insert_into_emp_login
DELIMITER //
CREATE PROCEDURE insert_into_emp_login(IN un VARCHAR(255), IN up VARCHAR(255))
BEGIN
    INSERT INTO Employee (EmployeeID, FirstName, LastName, Position) VALUES (NULL, un, up, NULL);
END //
DELIMITER ;

-- Procedure: insert_into_customer
DELIMITER //
CREATE PROCEDURE insert_into_customer(IN nm VARCHAR(50), IN ph VARCHAR(50), IN em VARCHAR(50), IN hn VARCHAR(50), IN city VARCHAR(50), IN zp VARCHAR(50), IN un VARCHAR(50), IN pwd VARCHAR(50))
BEGIN
    INSERT INTO Customer 
    (CustomerID, FirstName, LastName, GENDER, DOB, Email, Phone, Address)
    VALUES
    (NULL, nm, NULL, NULL, NULL, em, ph, CONCAT(hn, ', ', city, ', ', zp));
END //
DELIMITER ;

-- Procedure: insert_into_accounts
DELIMITER //
CREATE PROCEDURE insert_into_accounts(IN cid VARCHAR(50), IN cur_bal VARCHAR(50))
BEGIN
    INSERT INTO Account (AccountID, AccountNumber, Type, Balance, CustomerID) 
    VALUES (NULL, NULL, NULL, CAST(cur_bal AS DECIMAL(20, 2)), CAST(cid AS SIGNED));
END //
DELIMITER ;

-- Procedure: insert_into_branch
DELIMITER //
CREATE PROCEDURE insert_into_branch(IN nm VARCHAR(50), IN hn VARCHAR(50), IN cy VARCHAR(50), IN zc VARCHAR(50))
BEGIN
    INSERT INTO Branch (BranchID, Location, ManagerID) VALUES (NULL, CONCAT(hn, ', ', cy, ', ', zc), NULL);
END //
DELIMITER ;

-- Procedure: insert_into_transaction
DELIMITER //
CREATE PROCEDURE insert_into_transaction(IN aid VARCHAR(50), IN bid VARCHAR(50), IN amt VARCHAR(50), IN acn VARCHAR(50))
BEGIN
    INSERT INTO Transaction 
    (TransactionID, T_Date, Amount, Type, AccountID) 
    VALUES 
    (NULL, CURRENT_DATE(), CAST(amt AS DECIMAL(20, 2)), NULL, CAST(aid AS SIGNED));

    UPDATE Account
    SET Balance = Balance + CAST(amt AS DECIMAL(20, 2))
    WHERE AccountID = CAST(aid AS SIGNED);
END //
DELIMITER ;



-- ----------------------------------------------------------------------------------------------------------------------------



select * from card;







