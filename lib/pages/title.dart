import 'dart:async';

import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:apptest/pages/login.dart';
//import 'package:get/get.dart';

class title extends StatefulWidget {

  @override
  _titleState createState() => _titleState();
}


class _titleState extends State<title> {
  final theImage = AssetImage('assets/background.jpeg');
  startTimer() {
  Timer(const Duration(milliseconds: 1000), () {
   if (mounted) {
  Navigator.pushReplacementNamed(context, '/homeScreen');
};
  }
  );
  }
 @override
  void initState() {
    super.initState();
    // Iniciar o cronômetro
    startTimer();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
            image: DecorationImage(image: theImage, fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Plant',
              style: TextStyle(
                color: Colors.white,
                fontSize: 102.0,
                fontFamily: 'Salsa',
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Tomato plant disease detection system',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
