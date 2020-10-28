import 'package:collection_store/cubit/user_cubit.dart';
import 'package:collection_store/data/accout.dart';
import 'package:collection_store/screen/itemdetail.dart';
import 'package:flutter/material.dart';
import 'package:collection_store/config/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowitemScreen extends StatefulWidget {

  final int colindex;
  ShowitemScreen(this.colindex);

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
            onPressed: () => {
              //Navigator.of(context).pushNamed(AppRoutes.detail)
            },
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
                      BlocBuilder<UserCubit, Account>(
                        builder: (context, state) {
                          return Text(
                            '${state.collections[widget.colindex].colname}',
                            style: TextStyle(color: Colors.grey, fontSize: 40, fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      Spacer(),
                      FloatingActionButton(
                        backgroundColor: Color(0xFFFE5555),
                        mini: true,
                        child: Icon(Icons.add),
                        onPressed: () => {
                          Navigator.of(context).pushNamed(AppRoutes.additem, arguments: widget.colindex)
                          .then((value) => this.setState(() {})),
                        },
                      ),
                    ],
                  ),
                  Divider(color: Colors.black54, thickness: 3,),
                  Expanded(
                    child: BlocBuilder<UserCubit, Account>(
                      builder: (context, state){
                        return GridView.builder(
                          itemCount: state.collections[widget.colindex].itemsize,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.7,
                          ), 
                          itemBuilder: (context, index) => 
                            GestureDetector(
                              onTap: () => {
                                Navigator.of(context).pushNamed(AppRoutes.detail, arguments: DetailParameter(widget.colindex, index))
                                .then((value) => this.setState(() {})),
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
                                        child: Image.file(state.collections[widget.colindex].items[index].image, fit: BoxFit.fill,),
                                      ),
                                      Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.4,
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${state.collections[widget.colindex].items[index].name}'.toUpperCase(),
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