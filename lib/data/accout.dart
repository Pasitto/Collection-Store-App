import 'package:collection_store/data/collections.dart';

class Account{
  final String img, username;
  final int colsize;
  List<Collection> collentions = [];

  Account({
    this.img,
    this.username,
    this.colsize,
  });
}