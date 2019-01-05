import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/utils/dbhelper.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  var db = new DatabaseHelper();
  var _editTextController = TextEditingController();
  List items = [];

  @override
  void initState() {
    super.initState();
    showData();
  }

  showData() async{
    items= await db.allTask();
    setState(() {
      items = items.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bucket Drops",style: TextStyle(fontWeight: FontWeight.normal,color: Color(0xFFB05fcaa)),),
        backgroundColor: Color(0xFFB241543),
        centerTitle: false,
        elevation: 10.0,
        actions: <Widget>[
          IconButton(icon: Image.asset('images/ic_plus.png'), onPressed: _showFromDialog),
          IconButton(icon: Icon(Icons.more_vert,color: Color(0xFFB05fcaa) ,), onPressed: (){})
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png"),fit: BoxFit.cover)
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_,position){
            Task t = Task.fromMap(items[position]);
            return Card(
              child: ListTile(
                leading: Image.asset("images/ic_drop.png",height: 20,),
                title: Text(t.task),
                trailing: Text(t.time),
                onLongPress: () async{
                  setState(() {
                    items.removeAt(position);
                    var db = new DatabaseHelper();
                    db.deleteTask(t.id);
                  });
                },
              ),
            );
          },
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
    // Save Into Database
    var date = DateTime.now();
    Task addedItem = new Task(message,"${date.day}-${date.month}-${date.year}");
    await db.addTask(addedItem);
    Navigator.pop(context);

    setState(() {
      showData();
    });

  }

}

