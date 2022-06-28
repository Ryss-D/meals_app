import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxury,
}

class Meal {
  final String id;
  final List<String> categoryId;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactosaFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.imageUrl,
      required this.ingredients,
      required this.steps,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.isGlutenFree,
      required this.isLactosaFree,
      required this.isVegan,
      required this.isVegetarian});
}