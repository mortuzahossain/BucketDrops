import 'package:flutter/material.dart';
import 'package:todo/ui/home.dart';
import 'package:todo/ui/empty_home.dart';
import 'package:todo/utils/dbhelper.dart';


main() async{
  var db = new DatabaseHelper();
  int count = await db.countTask();
  runApp(MaterialApp(
    title: "To Do",
    home: count == 0 ? EmptyHome() : Home(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/home': (_) => Home(),
      '/emptyhome': (_) => EmptyHome()
    },
  ));
}

