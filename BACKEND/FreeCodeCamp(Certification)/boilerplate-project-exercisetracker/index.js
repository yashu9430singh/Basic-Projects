const express = require('express')
const app = express()
const cors = require('cors')
require('dotenv').config()
const bodyParser = require('body-parser');
const {v4: uuidv4} = require('uuid');

app.use(cors())
app.use(express.static('public'))
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html')
});
app.use(bodyParser.urlencoded({ extended: false }));



const users = [];
const exercises = {};

app.post('/api/users', (req, res)=>{
  const username = req.body.username;
  const _id = uuidv4();
  const newUser = {username, _id};
  users.push(newUser);
  exercises[_id] = [];
  res.json(newUser);
});

app.get('/api/users', (req, res)=>{
  res.json(users);
});

app.post('/api/users/:_id/exercises', (req, res)=>{
  const {_id} = req.params;
  const {description, duration, date} = req.body;
  const user = users.find(u => u._id == _id);

  if(!user) return  res.status(400).send('user not found');

  const exerciseDate = date ? new Date(date): new Date();
  const formattedDate = exerciseDate.toDateString();

  const exercise = {
    description, 
    duration: parseInt(duration),
    date: formattedDate
  };

  exercises[_id].push(exercise);

  res.json({
    username: user.username,
    description: exercise.description,
    duration: exercise.duration,
    date: exercise.date,
    _id: user._id
  });
});

app.get('/api/users/:_id/logs', (req, res) => {
  const { _id } = req.params;
  const user = users.find(u => u._id === _id);

  if (!user) return res.status(400).send('User not found');

  let userLogs = exercises[_id] || [];

  // Filter by from/to
  const { from, to, limit } = req.query;
  let fromDate = from ? new Date(from) : null;
  let toDate = to ? new Date(to) : null;

  if (fromDate || toDate) {
    userLogs = userLogs.filter(ex => {
      const exDate = new Date(ex.date);
      return (!fromDate || exDate >= fromDate) && (!toDate || exDate <= toDate);
    });
  }

  if (limit) {
    userLogs = userLogs.slice(0, parseInt(limit));
  }

  res.json({
    username: user.username,
    count: userLogs.length,
    _id: user._id,
    log: userLogs
  });
});


const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
});
