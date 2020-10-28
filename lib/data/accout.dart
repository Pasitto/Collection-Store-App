import 'dart:io';
import 'package:collection_store/data/collections.dart';

class Account{
  final File img;
  final String username, bio;
  final int colsize;
  List<Collection> collentions = [];

  Account({
    this.img,
    this.username,
    this.bio,
    this.colsize,
  });
}