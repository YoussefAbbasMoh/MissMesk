import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/side_menu_item.dart';
import 'package:miss_misq/features/home/models/side_menu_item_model.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int? _selectedIndex = 0;
  final Map<int, int> _selectedSubIndices = {};

  void _handleMenuItemTap(int index) {
    setState(() {
      _selectedSubIndices[index] = 0;
      _selectedIndex = index;
    });
  }

  void _handleSubItemTap(int mainIndex, int subIndex) {
    setState(() {
      _selectedSubIndices[mainIndex] = subIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallete.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppPallete.lightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 17,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        AssetsManager.logo,
                        width: 130,
                        height: 130,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...menuItems.asMap().entries.map((entry) {
              final item = entry.value;
              final index = entry.key;

              return SideMenuMainItem(
                model: item,
                isSelected: _selectedIndex == index,
                onTap: () {
                  _handleMenuItemTap(index);
                  if (item.subItems?.isNotEmpty ?? false) {
                    context.go(item.subItems!.first.route);
                  } else {
                    context.go(item.route);
                  }
                },
                subItems: item.subItems ?? [],
                isExpanded: _selectedIndex == index,
                selectedSubIndex: _selectedSubIndices[index] ?? 0,
                onSubItemSelected: (subIndex) {
                  _handleSubItemTap(index, subIndex);
                  context.go(item.subItems![subIndex].route);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
