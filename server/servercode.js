require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const { MongoClient } = require('mongodb');
const bcrypt = require('bcryptjs');

const app = express();
const port = process.env.PORT || 3000;
const mongoUri = process.env.MONGODB_URI;

app.use(bodyParser.json());

async function startServer() {
  try {
    console.log('Starting server setup...');
    const client = new MongoClient(mongoUri, { useNewUrlParser: true, useUnifiedTopology: true });
    await client.connect();
    console.log('Connected to MongoDB');

    const db = client.db('famie');
    const usersCollection = db.collection('famie_reg');

    // Signup endpoint
    app.post('/signup', async (req, res) => {
      const { email, username, password } = req.body;

      if (!email || !username || !password) {
        return res.status(400).json({ message: 'Missing fields' });
      }

      const existingUser = await usersCollection.findOne({ email });
      if (existingUser) {
        return res.status(400).json({ message: 'User already exists' });
      }

      const hashedPassword = await bcrypt.hash(password, 10);
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

      if (!email || !password) {
        return res.status(400).json({ message: 'Missing fields' });
      }

      const user = await usersCollection.findOne({ email });
      if (!user) {
        return res.status(401).json({ message: 'Login failed' });
      }

      const isValid = await bcrypt.compare(password, user.password);
      if (!isValid) {
        return res.status(401).json({ message: 'Login failed' });
      }

      res.status(200).json({ message: 'Login successful', user });
    });

    app.listen(port, () => {
      console.log(`Server running on port ${port}`);
    });
  } catch (error) {
    console.error("Failed to connect to MongoDB", error);
    process.exit(1); // Exit the process if unable to connect
  }
}

startServer();
