import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../meals/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final void Function(String) toggleFavorite;
  const FavoritesScreen(this.favoriteMeals, this.toggleFavorite, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You do not have any Meal(s) marked as Favorite!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: favoriteMeals[idx].id,
            title: favoriteMeals[idx].title,
            imageUrl: favoriteMeals[idx].imageUrl,
            duration: favoriteMeals[idx].duration,
            complexity: favoriteMeals[idx].complexity,
            affordability: favoriteMeals[idx].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
