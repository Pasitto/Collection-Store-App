import 'package:flutter/material.dart';

class AdditemScreen extends StatefulWidget {
  @override
  _AdditemScreenState createState() => _AdditemScreenState();
}

class _AdditemScreenState extends State<AdditemScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.85,
              decoration: BoxDecoration(
                color: Color(0xFFFE5555),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: <Widget>[
                  //start form
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}