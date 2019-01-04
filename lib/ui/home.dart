import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bucket Drops",style: TextStyle(fontWeight: FontWeight.normal),),
        backgroundColor: Color(0xFFB241543),
        centerTitle: true,
        elevation: 10.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
        },
        child: Icon(Icons.add),
      ),
      
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png"),fit: BoxFit.cover)
        ),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (_,int position){
            return Card(
              child: ListTile(
                title: Text("Run A Company"),
                leading: Image.asset('images/ic_drop.png',height: 20.0,),
                trailing: Text("10 years"),
                onTap: (){
                  // See Details
                },
                onLongPress: (){
                  // Delete
                },
              )
            );

          },
        ),
      ),
    );
  }
}
