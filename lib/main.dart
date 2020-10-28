import 'package:bloc/bloc.dart';
import 'package:collection_store/config/routes.dart';
import 'package:collection_store/cubit/user_cubit.dart';
import 'package:collection_store/screen/addcollection.dart';
import 'package:collection_store/screen/additem.dart';
import 'package:collection_store/screen/home.dart';
import 'package:collection_store/screen/itemdetail.dart';
import 'package:collection_store/screen/showitem.dart';
import 'package:collection_store/user_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  Bloc.observer = UserObserver();
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
        AppRoutes.addcol: (context) => AddcollectionScreen(),
      },
      onGenerateRoute: _registerRouteWithParameters,
    );
    return BlocProvider(
      create: (_) => UserCubit(),
      child: materialApp,
    );
  }
}

Route _registerRouteWithParameters(RouteSettings settings){
  
  if(settings.name == AppRoutes.showitem) {
    return MaterialPageRoute(builder: (context){
      return ShowitemScreen(settings.arguments);
    });
  }

  if(settings.name == AppRoutes.additem) {
    return MaterialPageRoute(builder: (context){
      return AdditemScreen(settings.arguments);
    });
  }

  if(settings.name == AppRoutes.detail) {
    return MaterialPageRoute(builder: (context){
      DetailParameter param = settings.arguments;
      return DetailScreen(param.colindex, param.itemindex);
    });
  }

}
