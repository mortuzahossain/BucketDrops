import 'package:flutter/material.dart';
import 'package:todo/assets/k_outline_button.dart';

class EmptyHome extends StatelessWidget {
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
                onPressed: () => {},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
