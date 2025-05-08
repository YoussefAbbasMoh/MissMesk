import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/home/models/legend_item_model.dart';

class TopSellingItemsAnalysis extends StatelessWidget {
  TopSellingItemsAnalysis({super.key});

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
        children: [
          const Text(
            'تحليل الأصناف المباعة خلال آخر شهر',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(height: 100),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              spacing: 40,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'عدد الوحدات المباعة',
                  style: AppTextStyles.font12GreyRegular,
                ),
                SizedBox(
                  height: context.height * 0.4,
                  child: BarChart(
                    BarChartData(
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),

                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 50,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              if (value % 50 == 0) {
                                return Text(
                                  value.toInt().toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 12),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: _buildBottomTitles,
                          ),
                        ),
                      ),
                      maxY: 450,

                      barGroups: _barGroups,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 40,
                  runSpacing: 20,
                  children:
                      legendItems
                          .map(
                            (item) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 8,
                                  width: 60,
                                  color: item.color,
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    item.label,
                                    style: AppTextStyles.font16BlackSemiBold,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> get _barGroups => [
    _buildGroup(0, 150, AppPallete.primaryColor),
    _buildGroup(1, 180, AppPallete.brownColor),
    _buildGroup(2, 210, AppPallete.greyColor),
    _buildGroup(3, 360, AppPallete.lightBrownColor),
    _buildGroup(4, 450, AppPallete.darkBrownColor),
  ];

  BarChartGroupData _buildGroup(int x, double item, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: item,
          color: color,
          width: 60,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const months = [
      'شال شتوي',
      'كاب رياضي',
      'جاكيت رسمي',
      'بنطلون جينز',
      'تيشيرت أسود',
    ];
    if (value.toInt() >= 0 && value.toInt() < months.length) {
      return Text(months[value.toInt()]);
    }
    return const SizedBox.shrink();
  }

  final List<LegendItem> legendItems = [
    const LegendItem(
      label: 'تيشيرت أسود: 450',
      color: AppPallete.darkBrownColor,
    ),
    const LegendItem(label: 'بنطلون جينز: 380', color: AppPallete.brownColor),
    const LegendItem(label: 'جاكيت رسمي: 210', color: AppPallete.greyColor),
    const LegendItem(
      label: 'كاب رياضي: 180',
      color: AppPallete.lightBrownColor,
    ),
    const LegendItem(label: 'شال شتوي: 150', color: AppPallete.primaryColor),
  ];
}
