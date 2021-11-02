import 'package:flutter/material.dart';

import '../filters/filters_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String label, Icon icon, void Function() execute) {
      return ListTile(
        leading: icon,
        title: Text(
          label,
          style: const TextStyle(
            fontFamily: 'FiraSansCondensed',
            fontWeight: FontWeight.normal,
            fontSize: 22,
          ),
        ),
        onTap: execute,
      );
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Cook it!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          buildListTile(
            'Meals',
            const Icon(
              Icons.restaurant,
              size: 24,
            ),
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            const Icon(
              Icons.settings,
              size: 24,
            ),
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
