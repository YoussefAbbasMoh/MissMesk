import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class NewItemInventoryDialog extends StatelessWidget {
  const NewItemInventoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'جرد صنف جديد',
      iconPath: AssetsManager.management,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('بيانات الصنف', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(height: 20),
          AppCustomTextField(
            width: context.width * 0.3,
            label: 'كود الصنف',
            hintText: 'أبحث بكود الصنف',
            prefixIcon: const Icon(
              Icons.search,
              color: AppPallete.lightGreyColor,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  backgroundColor: AppPallete.primaryColor,
                ),
                icon: const Icon(Icons.search, color: AppPallete.whiteColor),
              ),
            ),
          ),
          const VerticalSpacing(height: 20),
          const Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'اسم الصنف',
                  hintText: 'اسم الصنف',
                  titleFontSize: 14,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'وحدة الشراء',
                  hintText: 'نوع الصنف',
                  titleFontSize: 14,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: DropdownTextFieldWithTitle(
                  items: ['بواقي', 'منتجات مكتملة'],
                  value: 'بواقي',
                  title: 'حالة المنتج',
                  hintText: 'حالة المنتج',
                ),
              ),
            ],
          ),
          const VerticalSpacing(height: 20),
          const Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'الكمية الدفترية',
                  hintText: 'الكمية الدفترية',
                  titleFontSize: 14,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'الكمية الفعلية',
                  hintText: 'الكمية الفعلية',
                  titleFontSize: 14,
                  isRequired: false,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'الفروق (+  -)',
                  hintText: '100',
                  titleFontSize: 14,
                  isRequired: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
