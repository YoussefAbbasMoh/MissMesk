import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';

class InventoryTransactionsView extends StatelessWidget {
  const InventoryTransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final row = {
      'الرقم التسلسلي': const TableCustomText('1'),
      'رقم أمر الشغل': const TableCustomText('12345'),
      'المورد': const TableCustomText('اسم المورد'),
      'رقم أذن الإضافة الصرف': const TableCustomText('100'),
      'تاريخ العملية': const TableCustomText('21/07/2023'),
      'الكمية الواردة': const TableCustomText('200'),
      'الكمية المنصرفة': const TableCustomText('100'),
      'الحالة': const TableCustomText('اسم المسجل'),
      'الرصيد': const TableCustomText('100'),
      'قام بالتسجيل': const TableCustomText('اسم المسجل'),
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أتواب حرير مزركش ورد - أصفر كناري',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'كود الصنف: 019910',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                  Text(
                    'تاريخ إنشاء المنتج: 21/07/2023',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const SearchWithActions(),
            ],
          ),
          const VerticalSpacing(30),
          const Text(
            'سجل الحركات المخزنية',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(10),
          DynamicTable(
            tableHeight: 500,
            rowData: [row, row, row, row, row, row, row, row, row, row],
          ),
        ],
      ),
    );
  }
}
