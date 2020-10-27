import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFBF8181),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBF8181),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.35),
                    padding: EdgeInsets.only(
                      top: size.height * 0.1,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Column(
                          //body widget
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Score'),
                            Text(
                              'Name',
                              style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold,)
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'date: ',
                                  style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.bold,)
                                ),
                                Text(
                                  //demo
                                  'dd/mm/yyyy',
                                  style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.bold,)
                                ),
                              ],
                            ),
                            Divider(color: Colors.black45, thickness: 2,height: 35,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
                              ),
                              child: Container (
                                width: size.width * 0.8,
                                child: Column (
                                  children: <Widget>[
                                    //demo description
                                    Text(
                                      "Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ", 
                                      style: TextStyle(height: 1.3, fontSize: 15),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  //Head and image
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          //demo
                          'Nornal',
                          style: TextStyle(color: Colors.white, fontSize: 20,),
                        ),
                        Text(
                          //demo
                          'heading 4',
                          style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold,
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Card(
                              margin: EdgeInsets.all(20),
                              color: Colors.grey[200],
                              elevation: 5,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Container(
                                height: size.height * 0.3,
                                width: size.width * 0.5,
                                child:  Image.asset(
                                  //demo
                                  'assets/images/sneakers.jpg',
                                  fit: BoxFit.cover,
                                )
                              ) 
                            )
                          ],
                        )
                      ], 
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