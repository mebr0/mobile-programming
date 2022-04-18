import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  static final format = DateFormat("yyyy-MM-dd HH:mm");

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.white,
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: todo.done,
          onChanged: (_)  => toggle(context),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                ),
              ),
              Text(
                format.format(todo.deadline),
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () => delete(context),
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 30,
          ),
        ),
      ],
    ),
  );

  void toggle(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.toggleTodo(todo);
  }

  void delete(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.deleteTodo(todo);
  }
}
