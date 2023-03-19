const express = require('express');
const { v4: uuidv4 } = require('uuid');

const app = express();

// Set EJS as the templating engine
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: false }));
app.use(express.static(__dirname + '/public'));

// Create an array to store the tasks
const tasks = [];

// Render the home page with the tasks
app.get('/', (req, res) => {
  res.render('index', { tasks });
});

// Handle form submission to add a new task
app.post('/add', (req, res) => {
  const task = {
    id: uuidv4(),
    description: req.body.description,
    completed: false,
  };
  tasks.push(task);
  res.redirect('/');
});

// Handle completion of a task
app.post('/complete', (req, res) => {
  const taskId = req.body.taskId;
  const task = tasks.find((t) => t.id === taskId);
  task.completed = true;
  res.redirect('/');
});

// Handle deletion of a task
app.post('/delete', (req, res) => {
  const taskId = req.body.taskId;
  const taskIndex = tasks.findIndex((t) => t.id === taskId);
  tasks.splice(taskIndex, 1);
  res.redirect('/');
});

// Start the server
const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});