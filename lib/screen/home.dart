import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFE5555),
        shadowColor: Color(0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => {},
          )
        ],
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(   //Head of body
              height: 250,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFFE5555),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Welcome!',
                    style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.supervised_user_circle, 
                        size: 150, color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name',
                            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Detail',
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),  
                    ],
                  ),
                ],
              ),
            ),
            Container( //body
              height: 500,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'My Collecttion',
                        style: TextStyle(color: Colors.grey, fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      FloatingActionButton(
                        backgroundColor: Color(0xFFFE5555),
                        mini: true,
                        child: Icon(Icons.add),
                        onPressed: () => {},
                      ),
                    ],
                  ),
                  Divider(color: Colors.black54, thickness: 3,),
                  //Card Show 
                ],
              ),
            ),

          ],
        ),
      ),
    );  
  }
}