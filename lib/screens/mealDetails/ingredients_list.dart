import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final List<String> ingredients;
  final double useableHeight;
  const IngredientList(this.ingredients, this.useableHeight, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < ingredients.length; i += 2) {
      List<Widget> internal = [
        Expanded(
          child: Text(
            '- ${ingredients[i]}',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        if (i + 1 < ingredients.length)
          Expanded(
            child: Text(
              '- ${ingredients[i + 1]}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
      ];

      children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: internal,
        ),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: useableHeight * 0.2,
          child: Text(
            "Ingredients",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Container(
          constraints: BoxConstraints(maxHeight: useableHeight * 0.8),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
