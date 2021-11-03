import 'package:flutter/material.dart';

import '../drawer/side_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final void Function(Map<String, bool>) setFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.setFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _lactoseFree;
  late bool _glutenFree;
  late bool _vegetarian;
  late bool _vegan;

  @override
  initState() {
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  Widget _buildListTile(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChange,
  ) {
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => widget.setFilters({
          'gluten': _glutenFree,
          'vegan': _vegan,
          'lactose': _lactoseFree,
          'vegetarian': _vegetarian,
        }),
        icon: const Icon(Icons.fact_check),
        label: const Text('Update!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
