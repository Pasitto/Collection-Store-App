import 'dart:io';

class Item {
  final File image;
  final String name;
  final String description;
  final int day, month, year;
  final bool care;
  
  Item({
    this.image,
    this.name,
    this.description,
    this.day,
    this.month,
    this.year,
    this.care,
  });
}