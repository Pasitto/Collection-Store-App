import 'package:collection_store/data/accout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //demo test
    final Account user = Account(username: 'Pasitto');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFE5555),
        elevation: 0,
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
              height: size.height * 0.25,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFFE5555),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Welcome!',
                    style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.supervised_user_circle, 
                        size: size.height * 0.15, color: Colors.white,
                      ),
                      Container(
                        width: size.width * 0.5,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              user.username,
                              style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Detail',
                              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        size: size.height * 0.05, color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container( //body
              height: size.height * 0.6,
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
                      Spacer(),
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
                  Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.grey[200],
                    elevation: 3,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width * 0.4,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: size.height * 0.25,
                            width: size.width * 0.4,
                            child: Image.asset(
                              //demo
                              'assets/images/sneakers.jpg', 
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.4,
                            alignment: Alignment.center,
                            child: Text(
                              //demo
                              'Sneaker'.toUpperCase(),
                              style: Theme.of(context).textTheme.button.copyWith(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );  
  }
}