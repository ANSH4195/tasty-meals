import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import './category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: dummyCategories
          .map((data) => CategoryItem(data.id, data.title, data.color))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
