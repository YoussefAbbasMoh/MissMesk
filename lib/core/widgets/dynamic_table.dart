import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

// ignore: must_be_immutable
class DynamicTable extends StatelessWidget {
  final List<String> columnNames;
  final List<DataRow> rowData;
  final VoidCallback? onHeaderTap;
  final double? tableHeight;
  final double? tableWidth;
  final Color? headerColor;
  final Color? rowColor;

  DynamicTable({
    super.key,
    required this.columnNames,
    required this.rowData,
    this.onHeaderTap,
    this.tableHeight = 400,
    this.headerColor,
    this.rowColor,
    this.tableWidth,
  });

  double rowHeight = 60;
  double headerHeight = 70;

  double tableHeightCal() {
    return rowData.length * rowHeight + headerHeight;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeightCal(),
      width: tableWidth ?? double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: DataTable2(
          columnSpacing: 10,
          headingRowHeight: headerHeight,
          dataRowHeight: rowHeight,
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
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        softWrap: true,
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
