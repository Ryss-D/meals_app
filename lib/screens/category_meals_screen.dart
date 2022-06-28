import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The recipies'),
      ),
      body: const Center(
        child: Text('Recipies from category'),
      ),
    );
  }
}
