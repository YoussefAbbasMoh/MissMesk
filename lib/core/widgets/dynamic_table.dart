import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

// ignore: must_be_immutable
class DynamicTable<T> extends StatelessWidget {
  final List<T> rowData;
  final VoidCallback? onHeaderTap;
  final double? tableHeight;
  final double? tableWidth;
  final Color? headerColor;
  final Color? rowColor;

  DynamicTable({
    super.key,
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

  List<DataColumn> _buildColumns() {
    return _getColumnsNames(rowData[0])
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
        .toList();
  }

  List<DataRow> _buildRows() {
    return rowData
        .map(
          (e) => DataRow(
            cells: [..._getFields(e).map((e) => DataCell(Center(child: e)))],
          ),
        )
        .toList();
  }

  List<dynamic> _getFields(T item) {
    if (item is Map) {
      return item.values.toList();
    }
    return [];
  }

  List<dynamic> _getColumnsNames(T item) {
    if (item is Map) {
      return item.keys.toList();
    }
    return [];
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
          columns: _buildColumns(),
          rows: _buildRows(),
        ),
      ),
    );
  }
}
