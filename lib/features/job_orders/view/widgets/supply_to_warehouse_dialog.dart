import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/search_with_result.dart';
import 'package:miss_misq/core/widgets/switch_row.dart';

class SupplyToWarehouseDialog extends StatelessWidget {
  const SupplyToWarehouseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'توريد للمخزن',
      children: [
        const Text(
          'بيانات المنتج الموُرد',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        SearchWithResult(
          items: const ['قطن ناعم', 'قماش عالي الجودة', 'قماش كتان'],
          title: 'إبحث في المخزن',
          hintText: 'بحث يأسم أو كود الصنف',
          onItemSelected: (value) {},
        ),
        const Text('بيانات المخزن', style: AppTextStyles.font16BlackSemiBold),
        const Row(
          spacing: 20,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'كود المنتج',
                hintText: 'أدخل كود المنتج',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'اسم المنتج',
                hintText: 'أدخل اسم المنتج',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'الكمية الموُردة',
                hintText: 'أضف الكمية الموُردة',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
          ],
        ),
        SwitchRow(label: 'توريد مرتجعات', value: true, onChanged: (value) {}),
        Column(
          spacing: 20,
          children: List.generate(3, (index) {
            return const Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'اسم الصنف',
                    hintText: 'أتواب حرير مزركش ورود',
                    titleFontSize: 14,
                    isRequired: false,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'الوحدة',
                    hintText: 'متر',
                    titleFontSize: 14,
                    isRequired: false,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'كمية المرتجع',
                    hintText: 'أضف الكمية المرتجعة',
                    titleFontSize: 14,
                    isRequired: false,
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
