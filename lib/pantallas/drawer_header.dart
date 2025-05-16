import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/donfrancis.png')
              )
            ),
          ),
          Text('Mario Kreutzberger', style: TextStyle(color: Colors.white, fontSize: 23),), //nombre
          Text('donfrancis@therapyapp.cl', style: TextStyle(color: Colors.white, fontSize: 15,),), //correo
        ]

      ),
    );
  }
}

