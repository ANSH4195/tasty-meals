import 'package:flutter/material.dart';

class StepsList extends StatelessWidget {
  final List<String> steps;
  final double useableHeight;
  const StepsList(this.steps, this.useableHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < steps.length; i++) {
      children.add(
        Text(
          '- ${steps[i]}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: useableHeight * 0.1,
          child: Text(
            "Steps",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Container(
          height: useableHeight * 0.9,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemBuilder: (ctx, idx) {
              return Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    steps[idx],
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              );
            },
            itemCount: steps.length,
          ),
        ),
      ],
    );
  }
}
