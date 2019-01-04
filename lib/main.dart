import 'package:flutter/material.dart';
import 'package:todo/ui/home.dart';
import 'package:todo/ui/empty_home.dart';

main(){
  runApp(MaterialApp(
    title: "To Do",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

