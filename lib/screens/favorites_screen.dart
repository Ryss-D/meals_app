import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isNotEmpty
        ? ListView.builder(
            itemBuilder: (context, index) {
              var meal = widget.favoriteMeals[index];
              return MealItem(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability,
              );
            },
            itemCount: widget.favoriteMeals.length,
          )
        : const Center(
            child: Text('You have not favorites added yet!'),
          );
  }
}
