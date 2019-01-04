import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/utils/dbhelper.dart';

class Home extends StatefulWidget {

  List tasks;
  Home({Key key,this.tasks}) : super(key: key);

  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bucket Drops",style: TextStyle(fontWeight: FontWeight.normal,color: Color(0xFFB05fcaa)),),
        backgroundColor: Color(0xFFB241543),
        centerTitle: false,
        elevation: 10.0,
        actions: <Widget>[
          IconButton(icon: Image.asset('images/ic_plus.png'), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert,color: Color(0xFFB05fcaa) ,), onPressed: (){})
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png"),fit: BoxFit.cover)
        ),
        child: ListView.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (_,int position){
            var task = Task.fromMap(widget.tasks[position]);
            return Card(
              child: ListTile(
                title: Text(task.task),
                leading: Image.asset('images/ic_drop.png',height: 20.0,),
                trailing: Text(task.time),
                onTap: (){
                  // See Details
                },
                onLongPress: () async{
                  setState(() {
                    widget.tasks.removeAt(position);
                    var db = new DatabaseHelper();
                    db.deleteTask(task.id);
                  });
                },
              )
            );

          },
        ),
      ),
    );
  }

}

