require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const { MongoClient } = require('mongodb');
const bcrypt = require('bcryptjs');

const app = express();
const port = process.env.PORT || 3000;

// MongoDB connection string - make sure to replace it wiqth your actual connection string
const mongoUri = 'mongodb+srv://2022cetevivaresps:qqVJNQxQyjOOMREr@cluster0.4c8r3ww.mongodb.net/';

app.use(bodyParser.json());

MongoClient.connect(mongoUri, async (err, client) => {
  if (err) {
    console.error('Failed to connect to MongoDB', err);
    return;
  }
  console.log('Connected to MongoDB');
  const db = client.db('Famie');
  const usersCollection = db.collection('famie_reg');

  // Signup endpoint
  app.post('/signup', async (req, res) => {
    const { email, username, password } = req.body;

    // Validate input
    if (!email || !username || !password) {
      return res.status(400).json({ message: 'Missing email, username, or password' });
    }

    // Check if user already exists
    const existingUser = await usersCollection.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: 'User already exists' });
    }

    // Hash password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user
    await usersCollection.insertOne({
      email,
      username,
      password: hashedPassword,
    });

    res.status(201).json({ message: 'User created successfully' });
  });

  // Login endpoint
  app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    // Validate input
    if (!email || !password) {
      return res.status(400).json({ message: 'Missing email or password' });
    }

    // Check if user exists
    const user = await usersCollection.findOne({ email });
    if (!user) {
      return res.status(401).json({ message: 'Login failed' });
    }

    // Validate password
    const isValid = await bcrypt.compare(password, user.password);
    if (!isValid) {
      return res.status(401).json({ message: 'Login failed' });
    }

    res.status(200).json({ message: 'Login successful' });
  });

  app.listen(port, () => {
    console.log(`Server running on port ${port}`);
  });
});
