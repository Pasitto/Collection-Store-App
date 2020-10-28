import 'dart:io';

class Item {
  final File image;
  final String name;
  final String description;
  final DateTime date;
  final bool care;
  
  Item({
    this.image,
    this.name,
    this.description,
    this.date,
    this.care,
  });
}