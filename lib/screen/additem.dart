import 'package:collection_store/cubit/user_cubit.dart';
import 'package:collection_store/data/items.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdditemScreen extends StatefulWidget {

  final int colindex;
  AdditemScreen(this.colindex);
  @override
  _AdditemScreenState createState() => _AdditemScreenState();
}

class _AdditemScreenState extends State<AdditemScreen> {

  bool isSwitched = false;
  DateTime selected;
  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1960), 
      lastDate: DateTime.now(), 
    );
    setState(() {});
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  TextEditingController _namecontroller;
  TextEditingController _discontroller;
  void initState(){
    super.initState();
    _namecontroller = TextEditingController();
    _discontroller = TextEditingController();
  }
  
  void dispose() {
    _namecontroller.dispose();
    _discontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFE5555),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: size.height,
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
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'New Item'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: getImage,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: size.height * 0.2,
                      width: size.height * 0.2,
                      color: Colors.black12,
                      child: _image == null
                      ? Icon(Icons.add, size: 50,)
                      : Image.file(_image, fit: BoxFit.fill,),
                    ),
                  ),
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
                        controller: _namecontroller,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ),
                  ListTile(
                    leading: Text(
                      'Date   '.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    title: Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                        child:Text(
                        selected == null? 'select date':
                        DateFormat.yMMMd().format(selected),
                        style: TextStyle(
                          fontSize: 25,
                          color: selected == null? Colors.grey:Colors.black,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,  
                      ),
                      onPressed: () => _showDateTimePicker(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                            controller: _discontroller,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 22),
                            keyboardType: TextInputType.multiline,
                            maxLines: 5
                          ),
                        )
                      ]
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      'Care Notification'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: (value){
                        setState(() {
                          isSwitched=value;
                          //print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.yellowAccent,
                      activeColor: Colors.yellow,
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: FlatButton(
                      //disabledColor: Colors.yellow,
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      onPressed: () => {
                        context.bloc<UserCubit>().additem( 
                          Item(
                            _image,
                            _namecontroller.text,
                            _discontroller.text,
                            selected,
                            isSwitched,
                          ),
                          widget.colindex,
                        ),
                        context.bloc<UserCubit>().update(),
                        Navigator.of(context).pop(),
                      },
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