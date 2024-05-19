import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.registeredTodo});
  final List<Todo> registeredTodo;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late List<bool?> currentCheckboxValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentCheckboxValue =
        List.generate(widget.registeredTodo.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    void onCheckboxClick(bool? value, int index) {
      setState(() {
        currentCheckboxValue[index] = value;
      });
    }

    return ListView.builder(
      itemCount: widget.registeredTodo.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: Card(
            child: Row(
              children: [
                Checkbox(
                  value: currentCheckboxValue[index],
                  onChanged: (value) {
                    onCheckboxClick(value, index);
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
