import 'package:collection_store/data/items.dart';

class Collection {
  final String colname;
  final int itemsize;
  List<Item> items = [];
  
  Collection({
    this.colname,
    this.itemsize,
  });
}
