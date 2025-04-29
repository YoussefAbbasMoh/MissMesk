import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/side_menu_button.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int? _selectedIndex = 0;

  List<SideMenuButtonModel> menuItems = [
    SideMenuButtonModel(title: 'الصفحة الرئيسية', iconPath: AssetsManager.home),
    SideMenuButtonModel(
      title: 'إدارة المخزون والمنتجات',
      iconPath: AssetsManager.management,
    ),
    SideMenuButtonModel(
      title: 'الأصول الثابتة',
      iconPath: AssetsManager.assets,
    ),
    SideMenuButtonModel(
      title: 'سجل الموردين',
      iconPath: AssetsManager.supplieres,
    ),
    SideMenuButtonModel(title: 'سجل العملاء', iconPath: AssetsManager.clients),
    SideMenuButtonModel(
      title: 'متابعة الإنتاج',
      iconPath: AssetsManager.production,
    ),
    SideMenuButtonModel(title: 'دفتر اليومية', iconPath: AssetsManager.daily),
    SideMenuButtonModel(title: 'الإعدادات', iconPath: AssetsManager.settings),
  ];

  void _handleMenuItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        color: AppPallete.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: size.width * 0.18,
      height: size.height * 0.75,
      child: Column(
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
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalSpacing(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return SideMenuButton(
                  model: menuItems[index],
                  isSelected: _selectedIndex == index,
                  onTap: () => _handleMenuItemTap(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SideMenuButtonModel {
  final String title;
  final String iconPath;

  SideMenuButtonModel({required this.title, required this.iconPath});
}
