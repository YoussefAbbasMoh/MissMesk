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
    final row = {
      'الرقم التسلسلي': const Text('1'),
      'رقم المخزن': const Text('12345'),
      'اسم المخزن': const Text('اسم المخزن'),
      'اسم أمين المخزن': const Text('اسم أمين المخزن'),
      'الموظف القائم بالجرد': const Text('الموظف القائم بالجرد'),
      'تاريخ الجرد': const Text('21/07/2023'),
      'إجمالي الفروقات (أعداد)': const Text('بواقي'),
      '': InkWell(
        onTap: () {
          context.go(AppRoutes.inventoryDetails);
        },
        child: SvgPicture.asset(
          AssetsManager.linkOut,
          height: 30,
          fit: BoxFit.fill,
        ),
      ),
    };

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
          DynamicTable(rowData: [row, row, row, row, row, row]),
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
