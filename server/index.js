const cors = require('cors');
const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'pan0334',
    database: 'MVC',
    port: 3306
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the MySQL database.');
});

// Fetch jobs
app.get('/api/jobs', (req, res) => {
    db.query('SELECT * FROM Jobs', (err, results) => {
        if (err) {
            console.error('Error fetching jobs:', err);
            res.status(500).send('Server error');
            return;
        }
        res.json(results);
    });
});

// Login
app.post('/api/login', (req, res) => {
    const { username, password } = req.body;

    db.query(
        'SELECT * FROM Candidates  WHERE email = ? AND password = ?',
        [username, password], 
        (err, results) => {
            if (err) {
                console.error('Error during login:', err);
                res.status(500).send('Server error');
                return;
            }
            if (results.length > 0) {
                res.json({ success: true, message: 'Login successful' });
            } else {
                res.json({ success: false, message: 'Invalid credentials' });
            }
        }
    );
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
