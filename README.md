# Banking Application Backend

## Overview

Welcome to the **Banking Application Backend**! This project provides a robust backend service for managing various banking operations using **Express.js** and **MySQL**. The backend APIs handle customers, employees, accounts, branches, transactions, and more, integrating seamlessly with the frontend of a banking application.

## Features

### Customer Management

- Add, retrieve, update, and delete customer records.
- Search for customers by name and view their associated accounts.

### Employee Management

- Create and delete employee login records.
- View all employee records.

### Account Management

- Create, retrieve, update, and delete account records.
- View accounts associated with specific customers.

### Branch Management

- Create and delete branch records.
- Retrieve all branch records.

### Transaction Management

- Add new transactions.
- Retrieve transactions associated with specific customers.

### Additional Views

- Comprehensive view of customers and their accounts.
- Retrieve loan data and account balances using stored procedures.

## API Endpoints

### Customer

- **POST /customer**: Add a new customer.
- **GET /customer**: Retrieve all customers.
- **GET /customer/:FirstName**: Retrieve customer details by first name.
- **PUT /customer/:username**: Update customer details.
- **DELETE /customer/:CustomerID**: Delete a customer.

### Employee

- **POST /employee**: Add a new employee record.
- **GET /employee**: Retrieve all employees.
- **DELETE /employee/:username**: Delete an employee record.

### Account

- **POST /accounts**: Create a new account.
- **GET /accounts**: Retrieve all accounts.
- **GET /accounts/:CustomerID**: Retrieve accounts for a specific customer.
- **DELETE /accounts/:AccountID**: Delete an account.

### Branch

- **POST /branch**: Add a new branch record.
- **DELETE /branch/:BranchID**: Delete a branch record.
- **GET /branch**: Retrieve all branches.

### Transaction

- **POST /transaction**: Add a new transaction.
- **GET /transaction/:CustomerID**: Retrieve transactions for a specific customer.

### Additional Endpoints

- **GET /CustomerAccountView**: Retrieve a comprehensive view of customers and their accounts.
- **GET /loans**: Retrieve loan data.
- **GET /getBalance/:AccountID**: Retrieve the current balance for a specific account.

### Technologies Used
- **Node.js**: JavaScript runtime for building scalable network applications.
- **Express.js**: Web application framework for Node.js.
- **MySQL**: Relational database management system.
- **CORS**: Middleware for enabling Cross-Origin Resource Sharing.
  
## Installation

1. **Clone the repository:**

   ```bash
    git clone https://github.com/xAbdullahShaikh/online_banking_web_app.git

![image](https://github.com/user-attachments/assets/21303a93-29e1-4bbe-bfab-149e3b553ed5)
![image](https://github.com/user-attachments/assets/7e91b302-0e6d-45ad-8c74-28847bea258e)
![image](https://github.com/user-attachments/assets/c51606bc-90b6-4f27-b107-bedcdd1ea571)
![image](https://github.com/user-attachments/assets/a3786c42-0014-45bb-b06d-c2fac1a9d69f)




