// MongoDB Playground
use('Famie');

// Initialize the user collection for signup and login actions
db.createCollection('famie_reg');

// Sample user insertion simulating signup action
db.famie_reg.insertOne({
  email: "user@example.com",
  username: "user123",
  password: "hashedPassword123", // Note: In a real application, store hashed passwords
});

// Simulating the login action
// In a real application, you'd compare the hashed password with the hash of the input password
db.famie_reg.findOne({
  email: "user@example.com",
  // password: "hashedPassword123" - Password checking should be done in your application logic after fetching the hash
});

// For demonstration, insert multiple users to show a signup action
db.famie_reg.insertMany([
  { email: "user2@example.com", username: "user456", password: "hashedPassword456" },
  { email: "user3@example.com", username: "user789", password: "hashedPassword789" }
]);

// Query to find a user by email, simulating part of a login action
const userEmail = "user2@example.com";
const user = db.famie_reg.findOne({ email: userEmail });

// Print user details to the console
console.log(user);

// Remember: Actual password verification should be done in your application's backend logic,
// ideally using a secure password hashing algorithm like bcrypt.
