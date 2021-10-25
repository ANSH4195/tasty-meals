import 'package:flutter/material.dart';

import './screens/meals/meal_screen.dart';
import './screens/mealDetails/details_screen.dart';
import './screens/categories/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TastyMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(
          secondary: Colors.deepOrangeAccent,
        ),
        canvasColor: Colors.orange[50],
        fontFamily: 'SourceSansPro',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline2: const TextStyle(
                fontFamily: 'FiraCodeCondensed',
                fontWeight: FontWeight.w900,
                fontSize: 21,
                color: Colors.white,
              ),
              bodyText1: const TextStyle(
                fontFamily: 'FiraCodeCondensed',
                fontWeight: FontWeight.w900,
                fontSize: 21,
                color: Colors.black,
              ),
            ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.dark,
        ).copyWith(
          secondary: Colors.deepOrangeAccent,
        ),
        fontFamily: 'SourceSansPro',
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline2: const TextStyle(
                fontFamily: 'FiraCodeCondensed',
                fontWeight: FontWeight.w900,
                fontSize: 21,
                color: Colors.white,
              ),
              bodyText1: const TextStyle(
                fontFamily: 'FiraCodeCondensed',
                fontWeight: FontWeight.w900,
                fontSize: 21,
                color: Colors.black,
              ),
            ),
      ),
      themeMode: ThemeMode.light,
      home: const CategoryScreen(),
      routes: {
        MealScreen.routeName: (ctx) => const MealScreen(),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
      },
    );
  }
}
