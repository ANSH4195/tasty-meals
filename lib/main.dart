import 'package:flutter/material.dart';

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
            ),
      ),
      themeMode: ThemeMode.light,
      home: const CategoryScreen(),
    );
  }
}
