import 'package:flutter/material.dart';

class MealBrief extends StatelessWidget {
  final int duration;
  final String complexity;
  final String affordability;
  const MealBrief({
    required this.duration,
    required this.complexity,
    required this.affordability,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            const Icon(Icons.schedule),
            const SizedBox(
              width: 5,
            ),
            Text('$duration min'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.local_dining),
            const SizedBox(
              width: 5,
            ),
            Text(complexity),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.price_check),
            const SizedBox(
              width: 5,
            ),
            Text(affordability),
          ],
        ),
      ],
    );
  }
}
