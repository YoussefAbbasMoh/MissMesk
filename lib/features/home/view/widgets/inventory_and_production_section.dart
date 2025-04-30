import 'package:flutter/material.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';

class InventoryAndProductionSection extends StatelessWidget {
  const InventoryAndProductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: [
        DynamicTable(
          columnNames: ['كود الصنف', 'اسم الصنف', 'الوحدة', 'الكمية الدفترية'],
          rowData: [
            ['1', 'اسم الصنف', 'الوحدة', 'الكمية الدفترية'],
            ['2', 'اسم الصنف', 'الوحدة', 'الكمية الدفترية'],
            ['3', 'اسم الصنف', 'الوحدة', 'الكمية الدفترية'],
            ['4', 'اسم الصنف', 'الوحدة', 'الكمية الدفترية'],
          ],
          title: 'المخزون',
          tableHeight: 260,
        ),
        DynamicTable(
          columnNames: [
            'كود الصنف',
            'أوامر الإنتاج',
            'الوحدة',
            'الكمية الدفترية',
          ],
          rowData: [
            ['1', 'أمر الإنتاج', 'الوحدة', 'الكمية الدفترية'],
            ['1', 'أمر الإنتاج', 'الوحدة', 'الكمية الدفترية'],
            ['1', 'أمر الإنتاج', 'الوحدة', 'الكمية الدفترية'],
            ['1', 'أمر الإنتاج', 'الوحدة', 'الكمية الدفترية'],
          ],
          title: 'أوامر الإنتاج',
          tableHeight: 260,
        ),
      ],
    );
  }
}
