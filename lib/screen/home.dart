import 'package:collection_store/config/routes.dart';
import 'package:collection_store/cubit/user_cubit.dart';
import 'package:collection_store/data/accout.dart';
import 'package:collection_store/screen/showitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFE5555),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => {
              //Navigator.of(context).pushNamed(AppRoutes.showitem)
            },
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
                      BlocBuilder<UserCubit, Account>(
                        builder: (context, state) {
                          return Container(
                            width: size.height * 0.15,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                //demo
                                image: AssetImage('${state.img}')
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        width: size.width * 0.45,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BlocBuilder<UserCubit, Account>(
                              builder: (context, state) {
                                return Text(
                                  '${state.username}',
                                  style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                            BlocBuilder<UserCubit, Account>(
                              builder: (context, state) {
                                return Text(
                                  '${state.bio}',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: size.height * 0.05, color: Colors.white,
                        ),
                        onPressed: () => {},
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
                        onPressed: () => {
                          Navigator.of(context).pushNamed(AppRoutes.addcol),
                        },
                      ),
                    ],
                  ),
                  Divider(color: Colors.black54, thickness: 3,),
                  //Card Show 
                  Expanded(
                    child: BlocBuilder<UserCubit, Account>(
                      builder: (context, state){
                        return GridView.builder(
                          itemCount: state.colsize,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.7,
                          ), 
                          itemBuilder: (context, index) => 
                            GestureDetector(
                              onTap: () => {
                                Navigator.of(context).pushNamed(AppRoutes.showitem, arguments: index),
                              },
                              child: Card(
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
                                        child: Image.file(state.collentions[index].colimg, fit: BoxFit.fill,),
                                      ),
                                      Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.4,
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${state.collentions[index].colname}'.toUpperCase(),
                                          style: Theme.of(context).textTheme.button.copyWith(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        );
                      },
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