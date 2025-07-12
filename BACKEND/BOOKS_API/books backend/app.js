const express = require('express');
const app = express();
const bookRoutes = require('./routes/books');
const connectDB = require('./config/db');

connectDB();

app.use(express.json());
app.use('/books', bookRoutes);


const PORT = 3000;
app.listen(PORT, ()=>{
    console.log(`🚀 app running successfully running on port: ${PORT}`);
});