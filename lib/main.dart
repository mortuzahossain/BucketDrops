import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/ui/home.dart';
import 'package:todo/ui/empty_home.dart';
import 'package:todo/utils/dbhelper.dart';

main() async{

  var db = new DatabaseHelper();
//  int savetask = await db.addTask(new Task("Hello Task","2013-05-07"));
//  print("$savetask :User saved");

//  List data = await db.allTask();
//  print (data);

//  Task task = await db.singleTask(1);
//  print(task.toMap());

  runApp(MaterialApp(
    title: "To Do",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

