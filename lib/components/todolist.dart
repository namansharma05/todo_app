import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList(
      {super.key, required this.registeredTodo, required this.onCheckboxClick});
  final List<Todo> registeredTodo;
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
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 0,
          ),
          child: Card(
            child: Row(
              children: [
                Checkbox(
                  value: widget.registeredTodo[index].checkBoxValue,
                  onChanged: (value) {
                    widget.onCheckboxClick(value, index);
                  },
                ),
                Expanded(
                  child: widget.registeredTodo[index].checkBoxValue == false
                      ? Text(
                          widget.registeredTodo[index].title,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        )
                      : Text(
                          widget.registeredTodo[index].title,
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 17,
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
