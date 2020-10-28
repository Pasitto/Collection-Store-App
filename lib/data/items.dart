import 'dart:io';

class Item {
  File image;
  String name;
  String description;
  DateTime date;
  bool care;
  
  Item(
    this.image,
    this.name,
    this.description,
    this.date,
    this.care,
  );
}