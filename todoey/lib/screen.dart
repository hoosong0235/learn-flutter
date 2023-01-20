import 'package:flutter/material.dart';
import 'package:todoey/todoey.dart';
import 'package:todoey/todoprovider.dart';
import 'constants.dart';
import 'package:todoey/bottomsheet.dart' as bottomsheet;
import 'package:provider/provider.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int tasksNumber = 0;

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          backgroundColor: Colors.grey.shade600,
          context: context,
          builder: (context) => bottomsheet.BottomSheet(),
        ),
        backgroundColor: Colors.lightBlue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                listCircleAvatar,
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Todoey',
                  style: textStyle.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${todoProvider.todoList.length} Tasks',
                  style: textStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: boxDecoration,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  bottom: 64,
                  top: 16,
                ),
                itemCount: todoProvider.todoList.length,
                itemBuilder: (context, index) => Todoey(index: index),
              ),
            ),
          )
        ],
      ),
    );
  }
}
