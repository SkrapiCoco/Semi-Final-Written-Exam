import 'package:flutter/material.dart';
import 'package:prefinalwrittenexamination/model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final ToDo todo;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const TodoWidget(
      {Key? key,
        required this.todo,
        required this.onTap,
        required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
        child: Card(
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.deepPurpleAccent),
              borderRadius: BorderRadius.all(
              Radius.circular(10)),
          ),
          color: Colors.lightBlueAccent,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    todo.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                  child: Divider(
                    color: Colors.purpleAccent,
                    thickness: 2,
                  ),
                ),
                Text(todo.description,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
