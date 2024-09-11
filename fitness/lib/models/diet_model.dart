import 'package:flutter/material.dart';

class DietModel {
  final String name;
  final String iconPath;
  final Color boxColor;
  final String calories;
  final String makingTime;
  final String makingDifficulty;

  const DietModel(
      {required this.name,
      required this.iconPath,
      required this.boxColor,
      required this.calories,
      required this.makingTime,
      required this.makingDifficulty});

  static List<DietModel> getRecommendations() {
    List<DietModel> recommendations = [];

    recommendations.add(const DietModel(
        name: "Honey Pancake",
        iconPath: 'assets/images/sweet.png',
        boxColor: Color(0xFF92A3FD),
        calories: "180KCal",
        makingTime: "30mins",
        makingDifficulty: "Easy"));

    recommendations.add(const DietModel(
        name: "Canal Bread",
        iconPath: 'assets/images/cake.png',
        boxColor: Color(0xFFC58BF2),
        calories: "200KCal",
        makingTime: "20mins",
        makingDifficulty: "Easy"));

    recommendations.add(const DietModel(
        name: "Honey Pancake",
        iconPath: 'assets/images/sweet.png',
        boxColor: Color(0xFF92A3FD),
        calories: "180KCal",
        makingTime: "30mins",
        makingDifficulty: "Easy"));

    recommendations.add(const DietModel(
        name: "Canal Bread",
        iconPath: 'assets/images/cake.png',
        boxColor: Color(0xFFC58BF2),
        calories: "200KCal",
        makingTime: "20mins",
        makingDifficulty: "Easy"));

    recommendations.add(const DietModel(
        name: "Honey Pancake",
        iconPath: 'assets/images/sweet.png',
        boxColor: Color(0xFF92A3FD),
        calories: "180KCal",
        makingTime: "30mins",
        makingDifficulty: "Easy"));

    recommendations.add(const DietModel(
        name: "Canal Bread",
        iconPath: 'assets/images/cake.png',
        boxColor: Color(0xFFC58BF2),
        calories: "200KCal",
        makingTime: "20mins",
        makingDifficulty: "Easy"));

    return recommendations;
  }
}
