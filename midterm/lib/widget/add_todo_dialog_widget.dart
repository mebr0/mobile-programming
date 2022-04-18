import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  DateTime time = DateTime(0);

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Todo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          TodoFormWidget(
            title: "",
            time: time,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedTime: (time) => setState(() => this.time = time!),
            onSave: addTodo,
          ),
        ],
      ),
    ),
  );

  void addTodo() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        deadline: time,
        done: false,
    );

    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.addTodo(todo);

    Navigator.pop(context);
  }
}
