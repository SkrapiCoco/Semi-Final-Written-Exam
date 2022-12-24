import 'package:flutter/material.dart';
import 'package:prefinalwrittenexamination/pages/todo_list_display.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    title: ("Written Pre-Finals"),
    home: const ToDoList(),
  ));
}
