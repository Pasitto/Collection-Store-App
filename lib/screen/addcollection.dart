import 'dart:io';
import 'package:collection_store/cubit/user_cubit.dart';
import 'package:collection_store/data/collections.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddcollectionScreen extends StatefulWidget {
  @override
  _AddcollectionScreenState createState() => _AddcollectionScreenState();
}

class _AddcollectionScreenState extends State<AddcollectionScreen> {

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

  TextEditingController _controller;
  void initState(){
    super.initState();
    _controller = TextEditingController();
  }
  
  void dispose() {
    _controller.dispose();
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
                      'New Collection'.toUpperCase(),
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
                        controller: _controller,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25),
                      ),
                    )
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
                        //call state
                        context.bloc<UserCubit>().addCol(Collection(_image, _controller.text, 0)),
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