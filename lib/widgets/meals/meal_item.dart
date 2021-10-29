import 'package:flutter/material.dart';

import './meal_brief.dart';
import './meal_image.dart';
import '../mealDetails/details_screen.dart';
import '../../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenge';
      case Complexity.tricky:
        return 'Tricky';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Budget';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          MealDetailsScreen.routeName,
          arguments: id,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            MealImage(title, imageUrl),
            Padding(
              padding: const EdgeInsets.all(15),
              child: MealBrief(
                duration: duration,
                complexity: complexityText,
                affordability: affordabilityText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
