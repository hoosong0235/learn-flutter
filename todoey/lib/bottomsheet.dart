import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:provider/provider.dart';
import 'package:todoey/todoprovider.dart';

// ignore: must_be_immutable
class BottomSheet extends StatelessWidget {
  String text = '';

  BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);

    return Container(
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    decoration: inputDecoration,
                    onChanged: (value) => text = value,
                  ),
                ),
                const SizedBox(width: 32),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    todoProvider.addTodo(text);
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
