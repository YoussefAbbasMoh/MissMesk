import 'package:flutter/material.dart';
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

  void _handleMenuItemTap(int index) {
    setState(() {
      _selectedIndex = index;
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
            ...menuItems.map(
              (item) => SideMenuMainItem(
                model: item,
                isSelected: _selectedIndex == menuItems.indexOf(item),
                onTap: () {
                  _handleMenuItemTap(menuItems.indexOf(item));
                },
                subItems: item.subItems,
                isExpanded: _selectedIndex == menuItems.indexOf(item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
