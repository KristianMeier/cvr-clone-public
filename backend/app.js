const express = require('express')
const cors = require('cors')
const apiData = require('./data.js')

const app = express()
app.use(cors())
app.use(express.json())

const port = 4000

app.get('/', async (req, res) => {
  res.json(apiData)
})

app.listen(port, () => {
  console.log(`Server running on port ${port}...`)
})
