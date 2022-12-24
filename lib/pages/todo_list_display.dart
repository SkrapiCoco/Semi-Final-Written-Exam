import 'package:flutter/material.dart';
import 'package:prefinalwrittenexamination/db_helper/db_todo_helper.dart';
import 'package:prefinalwrittenexamination/model/todo_model.dart';
import 'package:prefinalwrittenexamination/pages/todoform.dart';
import 'package:prefinalwrittenexamination/widget/todo_widget.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(144, 48, 242, 1.0),
        appBar: AppBar(
          title: const Text('Todo List'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ToDoListForm()));
            setState(() {});
          },
          backgroundColor: const Color.fromRGBO(
              167, 78, 214, 1.0),
          child: const Icon(Icons.add, color: Colors.black),
        ),
        body: FutureBuilder<List<ToDo>?>(
          future: ToDoDataBaseHelper.getAllToDo(),
          builder: (context, AsyncSnapshot<List<ToDo>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemBuilder: (context, index) => TodoWidget(
                    todo: snapshot.data![index],
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ToDoListForm(todo: snapshot.data![index])));
                      setState(() {});
                    },
                    onLongPress: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(
                                  Radius.circular(10.0))),
                              backgroundColor: const Color.fromRGBO(144, 48, 240, 1.0),
                              title: const Text(
                                  'Are you sure you want to delete this Task?'),
                              actions: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                         const Color.fromRGBO(27, 221, 201, 1.0))),
                                  onPressed: () async {
                                    await ToDoDataBaseHelper.deleteTodo(
                                        snapshot.data![index]);
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: const Text('Yes'),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  itemCount: snapshot.data!.length,
                );
              }
              return const Center(
                child: Text('No Task yet'),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
