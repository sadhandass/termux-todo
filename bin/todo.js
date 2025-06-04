const fs = require('fs');
const file = 'todo.json';

// Load tasks from file or start with empty array
let tasks = [];
try {
  const data = fs.readFileSync(file, 'utf-8');
  tasks = JSON.parse(data);
} catch (err) {
  tasks = [];
}

const [,, cmd, ...args] = process.argv;

if (cmd === 'add') {
  const taskText = args.join(' ');
  tasks.push({ task: taskText, done: false });
  fs.writeFileSync(file, JSON.stringify(tasks, null, 2));
  console.log('Task added.');
} else if (cmd === 'list') {
  if (tasks.length === 0) {
    console.log('No tasks yet!');
  } else {
    console.log('Todo List:');
    tasks.forEach((t, i) => {
      const status = t.done ? '[✔]' : '[ ]';
      console.log(`${i + 1}. ${status} ${t.task}`);
    });
  }
} else {
  console.log('Usage: node todo.js add "task" | list');
}
