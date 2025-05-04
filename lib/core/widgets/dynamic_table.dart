import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class DynamicTable extends StatelessWidget {
  final List<String> columnNames;
  final List<DataRow> rowData;
  final VoidCallback? onHeaderTap;
  final double? tableHeight;
  final double? tableWidth;
  final Color? headerColor;
  final Color? rowColor;

  const DynamicTable({
    super.key,
    required this.columnNames,
    required this.rowData,
    this.onHeaderTap,
    this.tableHeight = 400,
    this.headerColor,
    this.rowColor,
    this.tableWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            inside: BorderSide(color: AppPallete.lightGreyColor, width: 2),
          ),
          headingTextStyle: AppTextStyles.font14WhiteSemiBold,
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
          rows: rowData,
        ),
      ),
    );
  }
}
