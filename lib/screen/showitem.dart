import 'package:flutter/material.dart';
import 'package:collection_store/config/routes.dart';

class ShowitemScreen extends StatefulWidget {
  @override
  _ShowitemScreenState createState() => _ShowitemScreenState();
}

class _ShowitemScreenState extends State<ShowitemScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFE5555),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => {Navigator.of(context).pushNamed(AppRoutes.detail)},
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container( //body
              height: size.height * 0.85,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        //demo
                        'Sneaker',
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
                  //Demo Card Show
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      children: <Widget>[
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
                    )
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