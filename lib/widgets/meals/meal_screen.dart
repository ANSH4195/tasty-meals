import 'package:flutter/material.dart';

import './meal_item.dart';
import '../../models/meal.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meals';
  final List<Meal> availableMeals;
  const MealScreen(this.availableMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = args['id']!;
    final categoryName = args['title']!;

    final meals = availableMeals.where((m) {
      return m.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: meals[idx].id,
            title: meals[idx].title,
            imageUrl: meals[idx].imageUrl,
            duration: meals[idx].duration,
            complexity: meals[idx].complexity,
            affordability: meals[idx].affordability,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
