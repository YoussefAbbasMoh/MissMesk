import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';

class InventoryAndProductionSection extends StatelessWidget {
  const InventoryAndProductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final row = {
      'كود الصنف': const TableCustomText('كود الصنف'),
      'اسم الصنف': const TableCustomText('اسم الصنف'),
      'الوحدة': const TableCustomText('الوحدة'),
      'الكمية الدفترية': const TableCustomText('الكمية الدفترية'),
    };
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              DynamicTable(rowData: [row, row, row, row]),
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
              DynamicTable(rowData: [row, row, row, row]),
            ],
          ),
        ),
      ],
    );
  }
}
