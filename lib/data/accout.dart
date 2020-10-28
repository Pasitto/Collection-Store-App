import 'package:collection_store/data/collections.dart';
import 'package:collection_store/data/items.dart';

class Account{
  String img;
  String username, bio;
  int colsize;
  List<Collection> collections = [];

  Account(
    this.img,
    this.username,
    this.bio,
    this.colsize,
  );
  
  //Function
  void addcollection(Collection col){
    colsize++;
    collections.add(col);
  }

  void additem(Item it, int colindex){
    collections[colindex].itemsize++;
    collections[colindex].items.add(it);
  }
}

Account user = Account(
  'assets/images/userimg.jpg',
  'Pasitto',
  '~~Nice day~~',
  0,
);

