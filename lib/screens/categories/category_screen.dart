import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import './category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TastyMeals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: dummyCategories
            .map((data) => CategoryItem(data.title, data.color))
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
