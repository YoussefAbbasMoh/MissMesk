import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/home/models/side_menu_item_model.dart';

class SideMenuMainItem extends StatefulWidget {
  const SideMenuMainItem({
    super.key,
    required this.model,
    required this.isSelected,
    required this.onTap,
    required this.subItems,
    required this.isExpanded,
  });

  final SideMenuButtonModel model;
  final bool isSelected;
  final VoidCallback onTap;
  final List<SideMenuSubItemModel> subItems;
  final bool isExpanded;

  @override
  State<SideMenuMainItem> createState() => _SideMenuMainItemState();
}

class _SideMenuMainItemState extends State<SideMenuMainItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SideMenuButton(
          model: widget.model,
          isSelected: widget.isSelected,
          onTap: widget.onTap,
        ),
        const VerticalSpacing(height: 5),
        if (widget.isExpanded)
          ...widget.subItems.map(
            (item) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = widget.subItems.indexOf(item);
                });
              },
              child: Container(
                width: double.infinity,
                color:
                    selectedIndex == widget.subItems.indexOf(item)
                        ? AppPallete.primaryColor.withAlpha(50)
                        : Colors.white,
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(8),
                child: Text(
                  item.title,
                  style: AppTextStyles.font16BlackRegular,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _SideMenuButton extends StatelessWidget {
  const _SideMenuButton({
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
    );
  }
}
