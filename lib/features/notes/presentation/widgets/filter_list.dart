import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../../notes.dart';

// Filter List Widget
class FilterList extends StatelessWidget {
  final List<String> filterItems;
  final int selectedFilterIndex;
  final Function(int) onFilterSelected;

  const FilterList({
    Key? key,
    required this.filterItems,
    required this.selectedFilterIndex,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter List Implementation
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          filterItems.length,
          (index) => GestureDetector(
            onTap: () {
              onFilterSelected(index);
            },
            child: FilterWidget(
              filterText: filterItems[index],
              isSelected: index == selectedFilterIndex,
            ),
          ),
        ),
      ),
    );
  }
}
