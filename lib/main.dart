import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/ui/home.dart';
import 'package:todo/ui/empty_home.dart';
import 'package:todo/utils/dbhelper.dart';

main() async{

//  var db = new DatabaseHelper();
//  int savetask = await db.addTask(new Task("Hello Task","2013-05-07"));
//  print("$savetask :User saved");

//  List data = await db.allTask();
//  print (data);

//  Task task = await db.singleTask(1);
//  print(task.toMap());

//  int count = await db.countTask();
//  print(count);

//  int update = await db.updateTask(Task.fromMap(
//      {
//        "id": 2,
//        "tasks" : "Updated Task",
//        "time" : "2014-05-07"
//      }
//  ));
//  print(update);


  runApp(MaterialApp(
    title: "To Do",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

