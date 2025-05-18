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
  final bool? isOutsideBorder;

  DynamicTable({
    super.key,
    required this.rowData,
    this.onHeaderTap,
    this.tableHeight = 400,
    this.headerColor,
    this.rowColor,
    this.tableWidth,
    this.isOutsideBorder = false,
  });

  double rowHeight = 60;
  double headerHeight = 70;

  double tableHeightCal() {
    return rowData.length * rowHeight + headerHeight;
  }

  List<DataColumn> _buildColumns() {
    return _getColumnsNames(rowData[0])
        .map(
          (name) => DataColumn2(
            fixedWidth: name == null || name.trim().isEmpty ? 70 : null,
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
          (e) => DataRow2(
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
          horizontalMargin: 0,
          columnSpacing: 10,
          headingRowHeight: headerHeight,
          dataRowHeight: rowHeight,
          headingRowColor: WidgetStateProperty.all<Color>(
            headerColor ?? AppPallete.primaryColor,
          ),
          dataRowColor: WidgetStateProperty.all<Color>(
            rowColor ?? AppPallete.whiteColor,
          ),
          border: TableBorder.symmetric(
            inside: const BorderSide(
              color: AppPallete.lightGreyColor,
              width: 2,
            ),
            outside: BorderSide(
              color: AppPallete.lightGreyColor,
              width: isOutsideBorder ?? false ? 0 : 2,
            ),
          ),
          headingTextStyle: AppTextStyles.font14WhiteSemiBold,
          columns: _buildColumns(),
          rows: _buildRows(),
        ),
      ),
    );
  }
}
