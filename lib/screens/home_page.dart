import 'package:flutter/material.dart';
import 'package:todo_app/components/todolist.dart';
import 'package:todo_app/widgets/newtodo.dart';
import 'package:todo_app/widgets/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> _registeredTodo = [
    Todo(title: 'sample todo item', checkBoxValue: false),
    Todo(title: 'Complete the todo app', checkBoxValue: false),
  ];

  void addNewItem(Todo newItem) {
    setState(() {
      _registeredTodo.add(newItem);
    });
  }

  void checkboxClick(bool? value, int index) {
    setState(() {
      _registeredTodo[index].checkBoxValue = value;
    });
  }

  void removeItem(Todo item) {
    int index = _registeredTodo.indexOf(item);
    setState(() {
      _registeredTodo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Application'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TodoList(
              registeredTodo: _registeredTodo,
              onCheckboxClick: checkboxClick,
              onRemoveItem: removeItem,
            ),
          ),
          NewTodo(
            onAddNewItem: addNewItem,
          ),
        ],
      ),
    );
  }
}
