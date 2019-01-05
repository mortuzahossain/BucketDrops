import 'package:flutter/material.dart';
import 'package:todo/assets/k_outline_button.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/utils/dbhelper.dart';
import 'home.dart';

class EmptyHome extends StatefulWidget {

  @override
  EmptyHomeState createState() {
    return new EmptyHomeState();
  }
}

class EmptyHomeState extends State<EmptyHome> {
  var db = new DatabaseHelper();

  var _editTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png"),fit: BoxFit.cover)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png",height: 200.0,width: 200.0,),

              Padding(padding: EdgeInsets.all(15.0),),

              KOutlineButton(
                radius: 30.0,
                borderColor: Colors.teal,
                text: 'Add A Drop'.toUpperCase(),
                textColor: Colors.tealAccent,
                onPressed: _showFromDialog,
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _showFromDialog() {
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(child: TextField(
            controller: _editTextController,
            autofocus: true,
            decoration: InputDecoration(
                labelText: "Add Task",
                hintText: "Join A Gamming Club",
                icon: Icon(Icons.note_add)
            ),
          ))
        ],
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          _handleSubmit(_editTextController.text);
          _editTextController.clear();
        }, child: Text("Save",style: TextStyle(color: Colors.white),),color: Colors.teal,),
        FlatButton(onPressed: ()=>Navigator.pop(context), child: Text("Cancel",style: TextStyle(color: Colors.white),),color: Colors.red,),
      ],
    );
    showDialog(context: context,builder: (_){
      return alert;
    });
  }

  void _handleSubmit(String message) async{
    if(message == null) Navigator.pop(context);
    else {
      var date = DateTime.now();
      Task addedItem = new Task(
          message, "${date.day}-${date.month}-${date.year}");
      await db.addTask(addedItem);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, "/home");
    }
  }
}
