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
  late List<bool?> _currentCheckboxValue;

  void addNewItem(Todo newItem) {
    setState(() {
      _registeredTodo.add(newItem);
      _currentCheckboxValue.add(false);
    });
  }

  void checkboxClick(bool? value, int index) {
    Todo indexElement = _registeredTodo[index];
    bool? indexValue = _currentCheckboxValue[index];
    setState(() {
      _registeredTodo.remove(indexElement);
      _currentCheckboxValue.remove(indexValue);
    });
  }

  @override
  void initState() {
    super.initState();
    _currentCheckboxValue = List.generate(_registeredTodo.length, (_) => false);
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
              currentCheckboxValue: _currentCheckboxValue,
              onCheckboxClick: checkboxClick,
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
