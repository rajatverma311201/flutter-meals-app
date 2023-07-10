import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_switch_item.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    final filterItems = [
      {
        "title": "Gluten-free",
        "subtitle": 'Only include gluten-free meals.',
        "value": activeFilters[Filter.glutenFree]!,
        "filter": Filter.glutenFree,
      },
      {
        "title": "Lactose-free",
        "subtitle": 'Only include lactose-free meals.',
        "value": activeFilters[Filter.lactoseFree]!,
        "filter": Filter.lactoseFree,
      },
      {
        "title": "Vegetarian",
        "subtitle": "Only include vegetarian meals",
        "value": activeFilters[Filter.vegetarian]!,
        "filter": Filter.vegetarian,
      },
      {
        "title": "Vegan",
        "subtitle": "Only include vegan meals",
        "value": activeFilters[Filter.vegan]!,
        "filter": Filter.vegan,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          for (final filterItem in filterItems)
            FilterSwitchItem(
              title: filterItem['title'] as String,
              subtitle: filterItem['subtitle'] as String,
              value: filterItem['value'] as bool,
              onChanged: (isChecked) => ref
                  .read(filtersProvider.notifier)
                  .setFilter(filterItem['filter'] as Filter, isChecked),
            ),
        ],
      ),
    );
  }
}
