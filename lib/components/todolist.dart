import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList(
      {super.key,
      required this.registeredTodo,
      required this.currentCheckboxValue,
      required this.onCheckboxClick});
  final List<Todo> registeredTodo;
  final List<bool?> currentCheckboxValue;
  final void Function(bool? value, int index) onCheckboxClick;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.registeredTodo.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: Card(
            child: Row(
              children: [
                Checkbox(
                  value: widget.currentCheckboxValue[index],
                  onChanged: (value) {
                    widget.onCheckboxClick(value, index);
                  },
                ),
                Expanded(child: Text(widget.registeredTodo[index].title))
              ],
            ),
          ),
        );
      },
    );
  }
}
