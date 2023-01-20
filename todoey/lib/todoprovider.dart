import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey/todoey.dart';

class TodoProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Todo> _todoList = [
    Todo(text: 'example 1', isChecked: false),
    Todo(text: 'example 2', isChecked: true),
    Todo(text: 'example 3', isChecked: false),
  ];

  UnmodifiableListView<Todo> get todoList => UnmodifiableListView(_todoList);

  changeTodo(index) {
    Todo todo = _todoList[index];
    _todoList[index] = Todo(text: todo.text, isChecked: !todo.isChecked);
    notifyListeners();
  }

  removeTodoAt(index) {
    _todoList.removeAt(index);
    notifyListeners();
  }

  addTodo(text) {
    _todoList.add(Todo(text: text, isChecked: false));
    notifyListeners();
  }
}
