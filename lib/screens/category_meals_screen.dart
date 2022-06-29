import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> avaliableMeals;

  const CategoryMealsScreen(this.avaliableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  // we use this instead of initState, no ensure that the context we use for some argments be created
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          // this is the way to use arguments passed via navigator
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      var categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.avaliableMeals.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((element) => element.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var meal = displayMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
