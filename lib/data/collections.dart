import 'dart:io';
import 'package:collection_store/data/items.dart';

class Collection {
  File colimg;
  String colname;
  int itemsize;
  List<Item> items = [];
  
  Collection(
    this.colimg,
    this.colname,
    this.itemsize,
  );
}
