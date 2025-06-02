import 'package:flutter/material.dart';
import 'package:miss_misq/core/widgets/custom_dropdown_menu.dart';

class DropDownFilter extends StatelessWidget {
  const DropDownFilter({
    super.key,
    required this.items,
    required this.title,
    this.dropDownWidth,
    this.onChanged,
    this.selected,
  });

  final String title;
  final List<String>? items;
  final double? dropDownWidth;
  final Function(String?)? onChanged;
  final String? selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(title),
          CustomDropdownMenu(
            items: items ?? [],
            width: dropDownWidth,
            value: selected,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
