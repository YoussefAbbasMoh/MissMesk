import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/side_menu.dart';

class SideMenuButton extends StatelessWidget {
  const SideMenuButton({
    super.key,
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  final SideMenuButtonModel model;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isSelected ? AppPallete.primaryColor : Colors.white,
        ),
        child: SingleChildScrollView(
          child: ListTile(
            leading: SvgPicture.asset(
              model.iconPath,
              colorFilter:
                  isSelected
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                      : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              width: 20,
            ),
            title: Text(
              model.title,
              style: AppTextStyles.font18BlackRegular.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
