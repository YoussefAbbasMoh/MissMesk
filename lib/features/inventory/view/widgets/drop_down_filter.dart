import 'package:flutter/material.dart';
import 'package:miss_misq/core/widgets/custom_dropdown_menu.dart';

class DropDownFilter extends StatelessWidget {
  const DropDownFilter({
    super.key,
    required this.items,
    required this.title,
    this.dropDownWidth,
  });

  final String title;
  final List<String> items;
  final double? dropDownWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(title),
          CustomDropdownMenu(
            items: items,
            value: items[0],
            width: dropDownWidth,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
