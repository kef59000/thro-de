const express = require('express')
const app = express()
const port = 8080

app.get('/', (req, res) => {
  res.send('Hello from Node.js Backend!')
})

app.listen(port, () => {
  console.log(`Backend listening at http://localhost:${port}`)
})
