
//connectionString: mongodb+srv://2022cetevivaresps:qqVJNQxQyjOOMREr@cluster0.4c8r3ww.mongodb.net/
const database = 'famie';
const collection1 = 'famie_reg';

// Create a new database.
use(database);

// Create a new collection.
db.createCollection(collection1);
db.collection1.insertOne({
    email: "user@example.com",
    username: "user123",
    password: "hashedPassword123", // Note: In a real application, store hashed passwords
  });
  
  // Simulating the login action
  // In a real application, you'd compare the hashed password with the hash of the input password
  db.collection1.findOne({
    email: "user@example.com",
    // password: "hashedPassword123" - Password checking should be done in your application logic after fetching the hash
  });
  
  // For demonstration, insert multiple users to show a signup action
  db.collection1.insertMany([
    { email: "user2@example.com", username: "user456", password: "hashedPassword456" },
    { email: "user3@example.com", username: "user789", password: "hashedPassword789" }
  ]);
  
  // Query to find a user by email, simulating part of a login action
  const userEmail = "user2@example.com";
  const user = db.collection1.findOne({ email: userEmail });
  
  // Print user details to the conso