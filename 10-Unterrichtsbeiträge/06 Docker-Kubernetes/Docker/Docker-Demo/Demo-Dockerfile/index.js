const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// Serve static files (including the image)
app.use(express.static(path.join(__dirname, 'public')));

// Define a route to serve HTML content
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public','index.html'));
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});