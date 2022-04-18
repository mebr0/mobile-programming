import 'package:flutter/material.dart';
import 'package:todo_app/widget/add_todo_dialog_widget.dart';
import 'package:todo_app/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Todo App"),
    ),
    floatingActionButton: FloatingActionButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.blue,
      onPressed: () =>
          showDialog(
              context: context,
              builder: (context) => const AddTodoDialogWidget(),
          ),
      child: const Icon(Icons.add),
    ),
    body: const TodoListWidget(),
  );
}
