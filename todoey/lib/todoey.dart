import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/todoprovider.dart';

class Todoey extends StatelessWidget {
  final int index;
  const Todoey({super.key, required this.index});

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);

    return GestureDetector(
      onLongPress: () => todoProvider.removeTodoAt(index),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        decoration: BoxDecoration(
            color: todoProvider.todoList[index].isChecked
                ? Colors.lightBlue
                : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            boxShadow: boxShadowList),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              todoProvider.todoList[index].text,
              style: todoProvider.todoList[index].isChecked
                  ? textStyle
                  : textStyle.copyWith(color: Colors.grey),
            ),
            Checkbox(
              checkColor: Colors.lightBlue,
              fillColor: MaterialStateColor.resolveWith(getColor),
              value: todoProvider.todoList[index].isChecked,
              onChanged: (value) => todoProvider.changeTodo(index),
            ),
          ],
        ),
      ),
    );
  }
}

class Todo {
  late String text;
  late bool isChecked;

  Todo({required this.text, required this.isChecked});
}
