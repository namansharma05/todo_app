import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList(
      {super.key,
      required this.registeredTodo,
      required this.onCheckboxClick,
      required this.onRemoveItem});
  final List<Todo> registeredTodo;
  final void Function(bool? value, int index) onCheckboxClick;
  final void Function(Todo item) onRemoveItem;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.registeredTodo.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(widget.registeredTodo[index]),
          onDismissed: (DismissDirection direction) {
            widget.onRemoveItem(widget.registeredTodo[index]);
          },
          direction: DismissDirection.endToStart,
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: const Icon(
              Icons.delete,
              size: 30,
              color: Colors.white,
            ),
          ),
          child: Container(
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
          ),
        );
      },
    );
  }
}
