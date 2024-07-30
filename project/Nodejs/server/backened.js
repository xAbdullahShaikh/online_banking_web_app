

// backend.js
const express = require('express');
const app = express();

const cors = require('cors');
app.use(cors());
app.use(express.json());

// Import the pool from the connection module
const pool = require('./connection.js');
const port = 5000;


app.listen(port, () => {
  console.log(`Listening at port ${port}...`);
});


app.post('/customer', async (req, res) => {
    try {
        console.log(req.body);
        const { CustomerID, FirstName, LastName, GENDER, DOB, Email, Phone, Address } = req.body;
        console.log(`${FirstName}`);
        
        // Use CALL to invoke the stored procedure
        const [rows] = await pool.execute('CALL insert_into_customer(?, ?, ?, ?, ?, ?, ?, ?)', [CustomerID, FirstName, LastName, GENDER, DOB, Email, Phone, Address]);
        res.send(rows);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Internal Server Error');
    }
});





//-------------------------------------------------------------------
//delete request 


// DELETE request for /customer/:customer_id
app.delete('/customer/:CustomerID', async (req, res) => {
  try {
    const { CustomerID } = req.params;

    // Use pool.execute to execute the DELETE query
    const [rows] = await pool.execute('DELETE FROM Customer WHERE CustomerID = ?', [CustomerID]);
    res.send(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});



//_________________________________________________________________________________________//
//                                                        Employee


// POST request for /employee
app.post('/employee', async (req, res) => {
  try {
    console.log(req.body);
    const { username, user_password } = req.body;

    // Use pool.execute to execute the stored procedure
    const [rows] = await pool.execute('CALL insert_into_emp_login(?, ?)', [username, user_password]);
    res.send('Inserted record into EMP_LOGIN table...');
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Internal Server Error');
  }
});

//------------------------------------------

// DELETE request for /employee/:username
app.delete('/employee/:username', async (req, res) => {
  try {
    const { username } = req.params;

    // Use pool.execute to execute the DELETE query
    const [rows] = await pool.execute('DELETE FROM emp_login WHERE username = ?', [username]);
    res.send(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});




//________________________________________________________________________________________________-//

//accounts
// POST request for /accounts
// POST request for /accounts
app.post('/accounts', async (req, res) => {
  try {
    const { AccountID, AccountNumber, Type, Balance, CustomerID} = req.body;

    // Use pool.execute to execute the INSERT query
    const [rows] = await pool.execute('INSERT INTO Account (AccountID, AccountNumber, Type, Balance, CustomerID) VALUES (?, ?, ?, ?, ?)', [AccountID, AccountNumber, Type, Balance, CustomerID]);
    
    // Send the response back to the client
    res.send('Record Inserted into Account table...');
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Internal Server Error');
  }
});


//-----------------------------------------------------------------
// DELETE request for /accounts/:account_id
app.delete('/accounts/:AccountID', async (req, res) => {
  try {
    const { AccountID } = req.params;

    // Use pool.execute to execute the DELETE query
    const [rows] = await pool.execute('DELETE FROM Account WHERE AccountID = ?', [AccountID]);
    
    // Send the response back to the client
    res.send(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});
//-------------------------------------------------

// GET request for /accounts
app.get('/accounts', async (req, res) => {
  try {
    // Use pool.execute to execute the query
    const [rows] = await pool.execute('SELECT * FROM Account') ;
    
    // Send the results back to the client
    res.json(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});
//-------------------------------------------------
// GET request for /accounts/:customer_id
app.get('/accounts/:CustomerID', async (req, res) => {
  try {
    const { CustomerID} = req.params;

    // Use pool.execute to execute the query
    const [rows] = await pool.execute('SELECT * FROM Account WHERE CustomerID = ?', [CustomerID]);
    
    // Send the results back to the client
    res.json(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});




//_______________________________________________________________________________________________//

// POST request for /branch
app.post('/branch', async (req, res) => {
  try {
    const { BranchID, Location, ManagerID} = req.body;

    // Use pool.execute to execute the stored procedure
    const [rows] = await pool.execute('CALL insert_into_branch(?, ?, ?)', [BranchID, Location, ManagerID]);
    
    // Send the response back to the client
    res.send('Inserted record into Branch table...');
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Internal Server Error');
  }
});

//----------------------------------------------------------------------------

// DELETE request for /branch/:branch_id
app.delete('/branch/:BranchID', async (req, res) => {
  try {
    const { BranchID } = req.params;

    // Use pool.execute to execute the DELETE query
    const [rows] = await pool.execute('DELETE FROM Branch WHERE BranchID = ?', [BranchID]);
    
    // Send the response back to the client
    res.send(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});


//_______________________________________________________________________________________________//
//transaction

// POST request for /transaction
app.post('/transaction', async (req, res) => {
  try {
    const { TransactionID, T_Date, Amount, Type, AccountID } = req.body;

    // Use pool.execute to execute the stored procedure
    const [rows] = await pool.execute('CALL insert_into_transaction(?, ?, ?, ?,?)', [TransactionID, T_Date, Amount, Type, AccountID]);
    
    // Send the response back to the client
    res.send('Inserted record into Transaction table...');
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});


//---------------------------------------------------------------------------
// GET request for /transaction/:customer_id
app.get('/transaction/:CustomerID', async (req, res) => {
  try {
    const { CustomerID} = req.params;

    // Use pool.execute to execute the query
    const [rows] = await pool.execute('SELECT Transaction.*, Account.CustomerID FROM Transaction LEFT JOIN Account ON Account.AccountID = Transaction.AccountID WHERE Account.CustomerID = ?', [CustomerID]);
    
    // Send the results back to the client
    res.json(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});

// GET request for /customer
app.get('/customer', async (req, res) => {
  try {
    // Use pool.execute to execute the query
    const [rows] = await pool.execute('SELECT * FROM Customer');
    
    // Send the results back to the client
    res.json(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});



//----------------------------------

app.get('/emp', async (req, res) => {
  try {
    // Use pool.execute to execute the query
    const [rows] = await pool.execute('SELECT * FROM EMP_LOGIN');
    
    // Send the results back to the client
    res.json(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});

// GET request for /employee
app.get('/employee', async (req, res) => {
  try {
    // Use pool.execute to execute the query
    const [rows] = await pool.execute('SELECT * FROM employee');
    
    // Send the results back to the client
    res.json(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});

// ------------------------------------------------
app.get('/branch', async (req, res) => {
  try {
    // Use pool.execute to execute the query
    const [rows] = await pool.execute('SELECT * FROM branch');
    
    // Send the results back to the client
    res.json(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});


//-------------------------------------------------------
// PUT request for /customer/:username
app.put('/customer/:username', async (req, res) => {
  try {
    const { username } = req.params;

    // Your logic for updating customer goes here

    res.send(`Update customer with username: ${username}`);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Internal Server Error');
  }
});

//------------------------------------------------------
//little different from expected 
// GET request for /customer/:username
app.get('/customer/:FirstName', async (req, res) => {
  try {
    const { FirstName } = req.params;

    // Use pool.execute to execute the query
    const [rows] = await pool.execute('SELECT Customer.*, Account.* FROM Customer LEFT JOIN Account ON Customer.CustomerID = Account.CustomerID WHERE Customer.FirstName = ?', [FirstName]);

    // Send the results back to the client
    res.json(rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});




// ----------------------------------------------------------------------
// new update section

app.get('/CustomerAccountView', async (req, res) => {
  try {
    // Use pool.execute to execute the SELECT query on the CustomerAccountView
    const [customerAccountData] = await pool.execute('SELECT * FROM CustomerAccountView');

    // Send the response back to the client with the fetched data
    res.json(customerAccountData);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});



app.get('/loans', async (req, res) => {
  try {
    // Use pool.execute to execute the SELECT query on the Loan table
    const [loanData] = await pool.execute('SELECT * FROM Loan');

    // Send the response back to the client with the fetched data
    res.json(loanData);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});

app.get('/getBalance/:AccountID', async (req, res) => {
  try {
    // Access the AccountID from the route parameters
    const AccountID = req.params.AccountID;

    // Check if AccountID is undefined or null
    if (!AccountID) {
      return res.status(400).json({ error: 'AccountID is required' });
    }

    // Use pool.execute to call the get_current_amount function
    const [result] = await pool.execute('SELECT get_current_amount(?) AS Balance', [AccountID]);

    // Check if the result is empty
    if (result.length === 0) {
      return res.status(404).json({ error: 'Account not found' });
    }

    // Send the response back to the client with the fetched balance
    res.json(result[0]);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Internal Server Error');
  }
});
