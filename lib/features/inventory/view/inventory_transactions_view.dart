import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class InventoryTransactionsView extends StatelessWidget {
  const InventoryTransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final row = const DataRow(
      cells: [
        DataCell(Center(child: Text('1'))),
        DataCell(Center(child: Text('12345'))),
        DataCell(Center(child: Text('اسم المورد'))),
        DataCell(Center(child: Text('100'))),

        DataCell(Center(child: Text('21/07/2023'))),
        DataCell(Center(child: Text('بواقي'))),
        DataCell(Center(child: Text('100'))),
        DataCell(Center(child: Text('اسم المسجل'))),
        DataCell(Center(child: Text('100'))),
        DataCell(Center(child: Text('اسم المسجل'))),
      ],
    );
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
          const VerticalSpacing(height: 30),
          const Text(
            'سجل الحركات المخزنية',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(height: 10),
          DynamicTable(
            tableHeight: 500,
            columnNames: const [
              'الرقم التسلسلي',
              'رقم أمر الشغل',
              'المورد',
              'رقم أذن الإضافة الصرف',
              'تاريخ العملية',
              'الكمية الواردة',
              'الكمية المنصرفة',
              'الحالة',
              'الرصيد',
              'قام بالتسجيل',
            ],
            rowData: [row, row, row, row, row, row, row, row, row, row],
          ),
        ],
      ),
    );
  }
}
