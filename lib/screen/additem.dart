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
      appBar: AppBar(
        backgroundColor: Color(0xFFFE5555),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: size.height * 0.85,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFFE5555),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
              child: Column(//start forms here
                children: <Widget>[
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}