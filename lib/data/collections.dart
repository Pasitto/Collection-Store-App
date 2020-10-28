import 'dart:io';
import 'package:collection_store/data/items.dart';

class Collection {
  final File colimg;
  final String colname;
  final int itemsize;
  List<Item> items = [];
  
  Collection({
    this.colimg,
    this.colname,
    this.itemsize,
  });
}
