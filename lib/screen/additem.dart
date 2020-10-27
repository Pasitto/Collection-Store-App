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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'New Item'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //add image

                  //
                  ListTile(
                    leading: Text(
                      'Name '.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    title: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        //controller: ,
                        //onChaged: ,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ),
                  //
                    //Date
                  //
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Discription '.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: size.height * 0.2,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            //controller: ,
                            //onChaged: ,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 22),
                            keyboardType: TextInputType.multiline,
                            maxLines: 5
                          ),
                        )
                      ]
                    ),
                  ),
                  //
                    //Care? choice
                  //
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: FlatButton(
                      //disabledColor: Colors.yellow,
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      onPressed: () => {},
                      child: Text('Add', style: TextStyle(fontSize: 25,color: Color(0xFFFE5555),fontWeight: FontWeight.bold),)
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