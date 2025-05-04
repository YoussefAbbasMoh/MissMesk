import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';

class InventoryAndProductionSection extends StatelessWidget {
  const InventoryAndProductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('المخزون', style: AppTextStyles.font18BlackRegular),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_sharp),
                  ],
                ),
              ),
              const DynamicTable(
                columnNames: [
                  'كود الصنف',
                  'اسم الصنف',
                  'الوحدة',
                  'الكمية الدفترية',
                ],
                rowData: [
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('اسم الصنف'))),
                      DataCell(Center(child: Text('الوحدة'))),
                      DataCell(Center(child: Text('الكمية الدفترية'))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('اسم الصنف'))),
                      DataCell(Center(child: Text('الوحدة'))),
                      DataCell(Center(child: Text('الكمية الدفترية'))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('اسم الصنف'))),
                      DataCell(Center(child: Text('الوحدة'))),
                      DataCell(Center(child: Text('الكمية الدفترية'))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('اسم الصنف'))),
                      DataCell(Center(child: Text('الوحدة'))),
                      DataCell(Center(child: Text('الكمية الدفترية'))),
                    ],
                  ),
                ],
                tableHeight: 260,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('المخزون', style: AppTextStyles.font18BlackRegular),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_sharp),
                  ],
                ),
              ),
              const DynamicTable(
                columnNames: [
                  'كود الصنف',
                  'اسم الصنف',
                  'الوحدة',
                  'الكمية الدفترية',
                ],
                rowData: [
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('اسم الصنف'))),
                      DataCell(Center(child: Text('الوحدة'))),
                      DataCell(Center(child: Text('الكمية الدفترية'))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('اسم الصنف'))),
                      DataCell(Center(child: Text('الوحدة'))),
                      DataCell(Center(child: Text('الكمية الدفترية'))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('اسم الصنف'))),
                      DataCell(Center(child: Text('الوحدة'))),
                      DataCell(Center(child: Text('الكمية الدفترية'))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('اسم الصنف'))),
                      DataCell(Center(child: Text('الوحدة'))),
                      DataCell(Center(child: Text('الكمية الدفترية'))),
                    ],
                  ),
                ],
                tableHeight: 260,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
