#!/data/data/com.termux/files/usr/bin/bash

TODO_FILE="$HOME/todo-list.txt"

# Menu
echo ""
echo "========= Termux TODO App ========="
echo "1. View Tasks"
echo "2. Add Task"
echo "3. Delete Task"
echo "4. Exit"
echo "==================================="
read -p "Choose an option (1-4): " option

case $option in
  1)
    echo ""
    echo "----- Your Tasks -----"
    if [ -s "$TODO_FILE" ]; then
      nl -w2 "$TODO_FILE"
    else
      echo "No tasks found."
    fi
    ;;
  2)
    read -p "Enter new task: " task
    echo "$task" >> "$TODO_FILE"
    echo "Task added!"
    ;;
  3)
    echo ""
    nl -w2 "$TODO_FILE"
    read -p "Enter task number to delete: " num
    sed -i "${num}d" "$TODO_FILE"
    echo "Task deleted!"
    ;;
  4)
    echo "Goodbye!"
    exit 0
    ;;
  *)
    echo "Invalid option."
    ;;
esac#!/data/data/com.termux/files/usr/bin/bash
echo "Welcome to Termux TODO App!"
