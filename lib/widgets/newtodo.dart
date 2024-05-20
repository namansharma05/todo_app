import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key, required this.onAddNewItem});
  final void Function(Todo newItem) onAddNewItem;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _enteredItem = TextEditingController();

  @override
  void dispose() {
    _enteredItem.dispose();
    super.dispose();
  }

  void onSubmitNewItem() {
    if (_enteredItem.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure a valid title was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
    widget.onAddNewItem(Todo(title: _enteredItem.text, checkBoxValue: false));
    FocusScope.of(context).unfocus();
    _enteredItem.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _enteredItem,
              autocorrect: false,
              autofocus: false,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 78, 67),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color.fromARGB(255, 0, 142, 123),
                iconColor: const Color.fromARGB(255, 0, 225, 195),
              ),
              onPressed: onSubmitNewItem,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
