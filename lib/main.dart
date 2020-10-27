import 'package:collection_store/screen/addcollection.dart';
import 'package:collection_store/screen/additem.dart';
import 'package:collection_store/screen/home.dart';
import 'package:collection_store/screen/itemdetail.dart';
import 'package:collection_store/screen/showitem.dart';
import 'package:flutter/material.dart';
import 'package:collection_store/config/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Collection Store',
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.showitem: (context) => ShowitemScreen(),
        AppRoutes.detail: (context) => DetailScreen(),
        AppRoutes.addcol: (context) => AddcollectionScreen(),
        AppRoutes.additem: (context) => AdditemScreen(),
      },
      //onGenerateInitialRoutes: _registerRWP,
    );
    return materialApp;
  }
}

// Route _registerRWP(RouteSettings settings){

// }