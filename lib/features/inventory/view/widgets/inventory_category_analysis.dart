import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class InventoryCategoryAnalysis extends StatelessWidget {
  const InventoryCategoryAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 46),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          const Text(
            'تحليل توزيع المخزون حسب الفئات الرئيسية',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          Row(
            spacing: 40,
            children: [
              SizedBox(
                height: 250,
                width: 300,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    startDegreeOffset: 70,
                    sections: [
                      PieChartSectionData(
                        titleStyle: AppTextStyles.font18WhiteSemiBold,
                        color: AppPallete.darkBrownColor,
                        value: 285,
                        title: '285',
                        radius: 120,
                      ),
                      PieChartSectionData(
                        color: AppPallete.lightBrownColor,
                        titleStyle: AppTextStyles.font18WhiteSemiBold,
                        value: 157,
                        title: '157',
                        radius: 120,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Container(
                        height: 10,
                        width: 60,
                        color: AppPallete.lightBrownColor,
                      ),
                      const Flexible(
                        child: Text(
                          'مخزن المنتجات المكتملة',
                          style: AppTextStyles.font18BlackRegular,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Container(
                        height: 10,
                        width: 60,
                        color: AppPallete.darkBrownColor,
                      ),
                      const Flexible(
                        child: Text(
                          'مخزن الخامات',
                          style: AppTextStyles.font18BlackRegular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
