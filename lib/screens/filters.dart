import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_switch_item.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitchItem(
            title: "Gluten-free",
            subtitle: 'Only include gluten-free meals.',
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) =>
                setState(() => _glutenFreeFilterSet = isChecked),
          ),
          FilterSwitchItem(
            title: "Lactose-free",
            subtitle: 'Only include lactose-free meals.',
            value: _lactoseFreeFilterSet,
            onChanged: (isChecked) =>
                setState(() => _lactoseFreeFilterSet = isChecked),
          ),
          FilterSwitchItem(
            title: "Vegetarian",
            subtitle: "Only include vegetarian meals",
            value: _vegetarianFilterSet,
            onChanged: (isChecked) =>
                setState(() => _vegetarianFilterSet = isChecked),
          ),
          FilterSwitchItem(
            title: "Vegan",
            subtitle: "Only include vegan meals",
            value: _veganFilterSet,
            onChanged: (isChecked) =>
                setState(() => _veganFilterSet = isChecked),
          ),
        ],
      ),
    );
  }
}
