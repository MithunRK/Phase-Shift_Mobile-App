import 'package:flutter/material.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  String description;
  Color colorsItem;

  ItemModel({
    this.expanded: false,
    @required this.headerItem,
    @required this.description,
    @required this.colorsItem,
  });
}
