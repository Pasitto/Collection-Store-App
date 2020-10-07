import 'package:collection_store/config/routes.dart';
import 'package:collection_store/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Collection Store',
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
      },
      //onGenerateInitialRoutes: _registerRWP,
    );
  }
}

Route _registerRWP(RouteSettings settings){

}