import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class DynamicTable extends StatelessWidget {
  final String title;
  final List<String> columnNames;
  final List<List<String>> rowData;
  final VoidCallback? onHeaderTap;
  final double? tableHeight;
  final Color? headerColor;
  final Color? rowColor;

  const DynamicTable({
    super.key,
    required this.title,
    required this.columnNames,
    required this.rowData,
    this.onHeaderTap,
    this.tableHeight = 400,
    this.headerColor,
    this.rowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onHeaderTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: AppTextStyles.font18BlackRegular),
                const SizedBox(width: 5),
                const Icon(Icons.arrow_forward_sharp),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: tableHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: DataTable2(
                columnSpacing: 10,
                headingRowColor: WidgetStateProperty.all<Color>(
                  headerColor ?? AppPallete.primaryColor,
                ),
                dataRowColor: WidgetStateProperty.all<Color>(
                  rowColor ?? AppPallete.whiteColor,
                ),
                border: const TableBorder.symmetric(
                  inside: BorderSide(
                    color: AppPallete.lightGreyColor,
                    width: 2,
                  ),
                ),
                columns:
                    columnNames
                        .map(
                          (name) => DataColumn(
                            label: Text(
                              name,
                              style: AppTextStyles.font14WhiteSemiBold,
                            ),
                            headingRowAlignment: MainAxisAlignment.center,
                          ),
                        )
                        .toList(),
                rows:
                    rowData
                        .map(
                          (row) => DataRow(
                            cells:
                                row
                                    .map(
                                      (cell) =>
                                          DataCell(Center(child: Text(cell))),
                                    )
                                    .toList(),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
