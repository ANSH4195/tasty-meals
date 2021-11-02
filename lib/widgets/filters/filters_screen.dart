import 'package:flutter/material.dart';

import '../drawer/side_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _lactoseFree = false;
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  Widget _buildListTile(
      String title, String subtitle, bool value, void Function(bool) onChange) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      drawer: const SideDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                  'Gluten-Free',
                  'Only include Gluten-free meals.',
                  _glutenFree,
                  (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  },
                ),
                _buildListTile(
                  'Lactose-Free',
                  'Only include Lactose-free meals.',
                  _lactoseFree,
                  (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  },
                ),
                _buildListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals.',
                  _vegetarian,
                  (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                ),
                _buildListTile(
                  'Vegan',
                  'Only include Vegan meals.',
                  _vegan,
                  (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
