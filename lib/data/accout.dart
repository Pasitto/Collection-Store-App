import 'package:collection_store/data/collections.dart';

class Account{
  String img;
  String username, bio;
  int colsize;
  List<Collection> collentions = [];

  Account(
    this.img,
    this.username,
    this.bio,
    this.colsize,
  );
  //Function
  void addcollection(Collection col){
    colsize++;
    collentions.add(col);
  }
}

Account user = Account(
  'assets/images/userimg.jpg',
  'Pasitto',
  '~~Nice day~~',
  0,
);

