import 'package:flutter/material.dart';
import 'package:therapy_app/pantallas/home_p.dart';
import 'package:therapy_app/pantallas/agenda.dart';
import 'package:therapy_app/pantallas/faq.dart';
import 'package:therapy_app/pantallas/settings.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2; //un poquito mas abajo
    final bottom = profileHeight / 2;
    
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: buildCoverImage(),
          ),

          Positioned(
            top: top,
            child: buildProfileImage(),
          ),
        ]
      ),
    );
  }

  Widget buildCoverImage()  => Container(
    color: Colors.grey,
    child: Image.asset(
      'images/profile1.png',
      height: coverHeight,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey,
    backgroundImage: AssetImage(
      'images/profile1.png'
      ),
  );

  Widget buildContent() => Column(
    children: [
      const SizedBox(height: 8),
      Text(
        'Mario Kreutzberger',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
    ]
  );
}