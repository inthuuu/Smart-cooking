// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:smart_cooking/models/Ingredient.dart';

class menu {
  String name;
  String img;
  List<Ingredients> ingredient;

  menu({required this.name, required this.img, required this.ingredient});
}
