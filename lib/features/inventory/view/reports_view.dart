import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/home/view/widgets/statistics_widget.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventory_category_analysis.dart';
import 'package:miss_misq/features/inventory/view/widgets/monthly_stock_usage_chart.dart';
import 'package:miss_misq/features/inventory/view/widgets/top_selling_items_analysis.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 30,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(alignment: Alignment.topLeft, child: SearchWithActions()),
          const StatisticsWidget(),
          TopSellingItemsAnalysis(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 46),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'تقرير الأصناف تحت حد الصرف',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                DynamicTable(
                  isOutsideBorder: true,
                  rowData: const [
                    {
                      'الرقم التسلسلي': TableCustomText('1'),
                      'رقم الصنف': TableCustomText('11010234'),
                      'اسم الصنف': TableCustomText('اسم الصنف'),
                      'الكمية المتاحة': TableCustomText('20'),
                      'حد الصرف': TableCustomText('30'),
                      'الكمية الناقصة': TableCustomText('10'),
                    },
                    {
                      'الرقم التسلسلي': TableCustomText('1'),
                      'رقم الصنف': TableCustomText('11010234'),
                      'اسم الصنف': TableCustomText('اسم الصنف'),
                      'الكمية المتاحة': TableCustomText('20'),
                      'حد الصرف': TableCustomText('30'),
                      'الكمية الناقصة': TableCustomText('10'),
                    },
                  ],
                  tableWidth: context.width * 0.5,
                ),
              ],
            ),
          ),
          const InventoryCategoryAnalysis(),
          const MonthlyStockUsageChart(),
        ],
      ),
    );
  }
}
