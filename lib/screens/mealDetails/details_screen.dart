import 'package:flutter/material.dart';

import '../../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = dummyMeals.firstWhere((m) => m.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            constraints: const BoxConstraints(minHeight: 100, maxHeight: 150),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 6,
              padding: const EdgeInsets.all(10),
              children: meal.ingredients.map((data) => Text(data)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
