import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';

class InventoryDetailsView extends StatelessWidget {
  const InventoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final row = {
      'الرقم التسلسلي': const TableCustomText('1'),
      'رقم كود الصنف': const TableCustomText('11010234'),
      'أسم الصنف': const TableCustomText('أتواب حرير مزركش ورد - أصفر كناري'),
      'الوحدة': const TableCustomText('متر'),
      'الكمية الدفترية': const TableCustomText('350'),
      'الكمية الفعلية': const TableCustomText('324'),
      'الفروق + -': const TableCustomText('12350'),
      'الحالة': const TableCustomText('بواقي'),
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('تفاصيل الجرد', style: AppTextStyles.font20BlackSemiBold),
          const VerticalSpacing(10),
          Text(
            'تاريخ بدأ الجرد: 21/07/2023',
            style: AppTextStyles.font12GreyRegular,
          ),
          const VerticalSpacing(40),
          const Text('بيانات المخزن', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(20),
          SizedBox(
            width: context.width * 0.5,
            child: Row(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: DropdownTextFieldWithTitle(
                    title: 'رقم المخزن',
                    items: const ['مخزن 1', 'مخزن 2', 'مخزن 3', 'مخزن 4'],
                    isRequired: true,
                    hintText: 'اختر رقم المخزن',
                    value: 'مخزن 1',
                    onChanged: (value) {},
                    fillColor: Colors.white,
                  ),
                ),
                Flexible(
                  child: DropdownTextFieldWithTitle(
                    title: 'اسم المخزن',
                    items: const ['مخزن 1', 'مخزن 2', 'مخزن 3', 'مخزن 4'],
                    isRequired: true,
                    hintText: 'اختر رقم المخزن',
                    value: 'مخزن 1',
                    onChanged: (value) {},
                    fillColor: Colors.white,
                  ),
                ),
                Flexible(
                  child: DropdownTextFieldWithTitle(
                    title: 'أمين المخزن',
                    items: const ['مخزن 1', 'مخزن 2', 'مخزن 3', 'مخزن 4'],
                    isRequired: true,
                    hintText: 'اختر رقم المخزن',
                    value: 'مخزن 1',
                    onChanged: (value) {},
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing( 30),
          const Text('بيانات الجرد', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(20),
          DynamicTable(rowData: [row, row, row, row, row]),
        ],
      ),
    );
  }
}
