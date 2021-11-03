import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './widgets/meals/meal_screen.dart';
import './widgets/filters/filters_screen.dart';
import './widgets/bottomTabs/tabs_screen.dart';
import './widgets/mealDetails/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TastyMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(
          secondary: Colors.orangeAccent,
          secondaryVariant: Colors.yellowAccent,
        ),
        canvasColor: Colors.orange[50],
        fontFamily: 'SourceSansPro',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontFamily: 'FiraCodeCondensed',
                fontWeight: FontWeight.w900,
                fontSize: 36,
                color: Colors.white,
              ),
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
              bodyText2: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.dark,
        ).copyWith(
          secondary: Colors.orangeAccent,
        ),
        fontFamily: 'SourceSansPro',
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline1: const TextStyle(
                fontFamily: 'FiraCodeCondensed',
                fontWeight: FontWeight.w900,
                fontSize: 36,
                color: Colors.white,
              ),
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
              bodyText2: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
      ),
      themeMode: ThemeMode.light,
      home: const TabsScreen(),
      routes: {
        MealScreen.routeName: (ctx) => MealScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
