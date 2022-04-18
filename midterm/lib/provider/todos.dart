import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> todos = [
    Todo(id: "1", title: "Buy a Toaster", deadline: DateTime(2022, 4, 23, 12, 00), done: false),
    Todo(id: "2", title: "Do homework", deadline: DateTime(2022, 4, 21, 23, 00), done: false),
    Todo(id: "3", title: "Cleaning", deadline: DateTime(2022, 4, 22, 14, 00), done: false),
    Todo(id: "4", title: "Visit parents", deadline: DateTime(2022, 4, 19, 9, 00), done: false),
  ];

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    todo.done = !todo.done;
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }
}
