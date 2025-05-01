import 'package:flutter/material.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/inventory/view/widgets/products_filter.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      children: const [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductsFilter(
                filters: ['الكل', 'المواد الخام', 'المنتجات المكتملة'],
              ),
              SearchWithActions(),
            ],
          ),
        ),
        VerticalSpacing(height: 30),

        DynamicTable(
          title: '',
          columnNames: [
            'الرقم التسلسلي',
            'كود الصنف',
            'اسم الصنف',
            'الوحدة',
            'الكمية الدفترية',
            '',
          ],
          rowData: [
            [
              'الرقم التسلسلي',
              'كود الصنف',
              'اسم الصنف',
              'الوحدة',
              'الكمية الدفترية',
              '',
            ],
            [
              'الرقم التسلسلي',
              'كود الصنف',
              'اسم الصنف',
              'الوحدة',
              'الكمية الدفترية',
              '',
            ],
            [
              'الرقم التسلسلي',
              'كود الصنف',
              'اسم الصنف',
              'الوحدة',
              'الكمية الدفترية',
              '',
            ],
            [
              'الرقم التسلسلي',
              'كود الصنف',
              'اسم الصنف',
              'الوحدة',
              'الكمية الدفترية',
              '',
            ],
            [
              'الرقم التسلسلي',
              'كود الصنف',
              'اسم الصنف',
              'الوحدة',
              'الكمية الدفترية',
              '',
            ],
          ],
        ),
      ],
    );
  }
}
