import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return ListView.separated(
        itemBuilder: (context, index) {
          final todo = todos[index];

          return TodoWidget(todo: todo);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: todos.length
    );
  }
}
