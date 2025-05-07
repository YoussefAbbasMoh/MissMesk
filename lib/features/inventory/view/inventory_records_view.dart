import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/inventory/view/widgets/drop_down_filter.dart';

class InventoryRecordsView extends StatelessWidget {
  const InventoryRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    final row = DataRow(
      cells: [
        const DataCell(Center(child: Text('1'))),
        const DataCell(Center(child: Text('12345'))),
        const DataCell(Center(child: Text('اسم المورد'))),
        const DataCell(Center(child: Text('100'))),
        const DataCell(Center(child: Text('21/07/2023'))),
        const DataCell(Center(child: Text('بواقي'))),
        const DataCell(Center(child: Text('100'))),
        DataCell(
          onTap: () {
            context.go(AppRoutes.inventoryDetails);
          },
          Center(
            child: SvgPicture.asset(
              AssetsManager.linkOut,
              height: 30,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            spacing: 30,
            children: [
              DropDownFilter(
                title: 'اسم المخزن',
                items: ['مخزن السلام', 'مخزن مدينة نصر', 'مخزن التجمع'],
              ),
              DropDownFilter(
                title: 'اسم أمين المخزن',
                items: ['أحمد               ', 'محمد', 'محمد', 'محمد'],
              ),
              Spacer(),
              SearchWithActions(),
            ],
          ),
          const VerticalSpacing(height: 40),
          DynamicTable(
            columnNames: const [
              'الرقم التسلسلي',
              'رقم المخزن',
              'اسم المخزن',
              'اسم أمين المخزن',
              'الموظف القائم بالجرد',
              'تاريخ الجرد',
              'إجمالي الفروقات (أعداد)',
              '',
            ],
            rowData: [row, row, row, row, row, row],
          ),
          const VerticalSpacing(height: 20),
          AppCustomButton(
            title: 'عملية جرد جديدة',
            icon: Icons.add,
            onPressed: () {
              context.go(AppRoutes.newInventoryProcess);
            },
          ),
        ],
      ),
    );
  }
}
