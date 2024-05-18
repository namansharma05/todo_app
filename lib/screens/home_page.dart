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
    Todo(title: 'sample todo item'),
    Todo(title: 'Complete the todo app'),
  ];

  void addNewItem(Todo newItem) {
    setState(() {
      _registeredTodo.add(newItem);
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
