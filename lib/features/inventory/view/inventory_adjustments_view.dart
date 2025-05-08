import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';

class InventoryAdjustmentsView extends StatelessWidget {
  const InventoryAdjustmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final row = {
      'الرقم التسلسلي': const TableCustomText('1'),
      'رقم المخزن': const TableCustomText('12345'),
      'اسم المخزن': const TableCustomText('اسم المخزن'),
      'مكان المخزن': const TableCustomText(
        'سوق العبور و امام كارفور، المنطقة الصناعية أ، قسم السلام شارع 40',
      ),
      'الرفوف': const TableCustomText('100'),
      '': InkWell(
        child: const Icon(Icons.edit, color: Colors.black),
        onTap: () {},
      ),
      ' ': InkWell(
        child: const Icon(Icons.delete_outline, color: Colors.black),
        onTap: () {},
      ),
    };
    final row2 = {
      'الرقم التسلسلي': const TableCustomText('1'),
      'اسم الأمين': const TableCustomText('اسم الأمين'),

      'اسم المخزن': const TableCustomText('اسم المخزن'),

      '': InkWell(
        child: const Icon(Icons.edit, color: Colors.black),
        onTap: () {},
      ),
      ' ': InkWell(
        child: const Icon(Icons.delete_outline, color: Colors.black),
        onTap: () {},
      ),
    };
    final row3 = {
      'الرقم التسلسلي': const TableCustomText('1'),
      'الوحدة': const TableCustomText('الوحدة'),
      '': InkWell(
        child: const Icon(Icons.edit, color: Colors.black),
        onTap: () {},
      ),
      ' ': InkWell(
        child: const Icon(Icons.delete_outline, color: Colors.black),
        onTap: () {},
      ),
    };
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'إعدادات المخازن',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(height: 40),
          const Text('سجل المخازن', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(height: 10),
          DynamicTable(rowData: [row, row, row, row]),
          const VerticalSpacing(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: AppCustomButton(
              title: 'إضافة مخزن',
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
          const VerticalSpacing(height: 40),
          SizedBox(
            width: context.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'سجل أمناء المخازن',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                const VerticalSpacing(height: 10),
                DynamicTable(rowData: [row2, row2, row2, row2]),
                const VerticalSpacing(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppCustomButton(
                    title: 'إضافة أمين',
                    onPressed: () {},
                    icon: Icons.add,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(height: 40),
          SizedBox(
            width: context.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'وحدات الأصناف',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                const VerticalSpacing(height: 10),
                DynamicTable(rowData: [row3, row3, row3, row3]),
                const VerticalSpacing(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppCustomButton(
                    title: 'إضافة وحدة',
                    onPressed: () {},
                    icon: Icons.add,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(height: 40),
          const Text(
            'التحكم بالمخزن',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(height: 20),
          AppCustomButton(
            title: 'رفع أصناف جديدة',
            onPressed: () {},
            icon: Icons.upload_outlined,
          ),
        ],
      ),
    );
  }
}
