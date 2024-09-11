import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String iconPath;
  final Color boxColor;

  const CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(const CategoryModel(
        name: 'Pancake',
        iconPath: 'assets/images/sweet.png',
        boxColor: Color(0xFF92A3FD)));

    categories.add(const CategoryModel(
        name: 'Cake',
        iconPath: 'assets/images/cake.png',
        boxColor: Color(0xFFC58BF2)));

    categories.add(const CategoryModel(
        name: 'Pancake',
        iconPath: 'assets/images/sweet.png',
        boxColor: Color(0xFF92A3FD)));

    categories.add(const CategoryModel(
        name: 'Cake',
        iconPath: 'assets/images/cake.png',
        boxColor: Color(0xFFC58BF2)));

    categories.add(const CategoryModel(
        name: 'Pancake',
        iconPath: 'assets/images/sweet.png',
        boxColor: Color(0xFF92A3FD)));

    categories.add(const CategoryModel(
        name: 'Cake',
        iconPath: 'assets/images/cake.png',
        boxColor: Color(0xFFC58BF2)));

    categories.add(const CategoryModel(
        name: 'Pancake',
        iconPath: 'assets/images/sweet.png',
        boxColor: Color(0xFF92A3FD)));

    categories.add(const CategoryModel(
        name: 'Cake',
        iconPath: 'assets/images/cake.png',
        boxColor: Color(0xFFC58BF2)));

    return categories;
  }
}
