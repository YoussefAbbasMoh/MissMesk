import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class MonthlyStockUsageChart extends StatelessWidget {
  const MonthlyStockUsageChart({super.key});

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'تحليل أداء صرف الأصناف خلال أخر شهر',
                style: AppTextStyles.font16BlackSemiBold,
              ),
              const Spacer(),
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
                          'صرف للبيع',
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
                          'صرف للتشغيل ',
                          style: AppTextStyles.font18BlackRegular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const VerticalSpacing( 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 40,
              children: [
                Text(
                  'عدد عمليات الصرف',
                  style: AppTextStyles.font12GreyRegular,
                ),
                SizedBox(
                  height: context.height * 0.5,
                  child: BarChart(
                    BarChartData(
                      barGroups: _barGroups,
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 50,
                            getTitlesWidget: _bottomTitles,
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget:
                                (value, _) => Text(
                                  value.toInt().toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                          ),
                        ),
                      ),
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      groupsSpace: 20,
                      barTouchData: BarTouchData(enabled: true),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    switch (value.toInt()) {
      case 0:
        return const Text('المخزن الجديد');
      case 1:
        return const Text('مخزن السلام 2');
      case 2:
        return const Text('مخزن المحلة');
      case 3:
        return const Text('مخزن السلام');
      case 4:
        return const Text('مخزن مدينة نصر');
      default:
        return const Text('');
    }
  }

  List<BarChartGroupData> get _barGroups => [
    _buildGroup(0, 2290, 7219),
    _buildGroup(1, 3376, 7219),
    _buildGroup(2, 489, 7890),
    _buildGroup(3, 10000, 8228),
    _buildGroup(4, 700, 7530),
  ];

  BarChartGroupData _buildGroup(int x, double sales, double operation) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: sales,
          color: const Color(0xFFD4AF63),
          width: 40,
          borderRadius: BorderRadius.zero,
        ),
        BarChartRodData(
          toY: operation,
          color: const Color(0xFF5F3C0A),
          width: 40,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }
}
