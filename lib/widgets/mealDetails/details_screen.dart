import 'package:flutter/material.dart';

import '../../dummy_data.dart';

import './steps_list.dart';
import './ingredients_list.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final void Function(String) toggleFavorite;
  final bool Function(String) isFavorite;
  const MealDetailsScreen(this.toggleFavorite, this.isFavorite, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = dummyMeals.firstWhere((m) => m.id == mealId);
    final useableHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: useableHeight * 0.4,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          IngredientList(meal.ingredients, useableHeight * 0.2),
          StepsList(meal.steps, useableHeight * 0.4),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealId)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
