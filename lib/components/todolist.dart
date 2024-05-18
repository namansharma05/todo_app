import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.registeredTodo});
  final List<Todo> registeredTodo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredTodo.length,
      itemBuilder: (context, index) {
        return Card(
          child: Text(registeredTodo[index].title),
        );
      },
    );
  }
}
