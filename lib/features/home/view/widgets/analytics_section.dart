import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/features/home/models/legend_item_model.dart';
import 'package:miss_misq/features/home/view/widgets/insight_card.dart';

class AnalyticsSection extends StatelessWidget {
  const AnalyticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        spacing: 20,
        children: [
          Expanded(child: _buildMonthlyProductionCard()),
          Expanded(child: _buildCostDistributionCard()),
          Expanded(child: _buildProductionEfficiencyCard()),
        ],
      ),
    );
  }

  Widget _buildMonthlyProductionCard() {
    return InsightCard(
      title: 'الإنتاج الشهري',
      chart: BarChart(
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
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: _buildBottomTitles,
              ),
            ),
          ),
          maxY: 10,
          barGroups: _buildBarGroups(),
        ),
      ),
      legendItems: const [
        LegendItem(color: AppPallete.darkBrownColor, label: 'يناير 60%'),
        LegendItem(color: AppPallete.lightBrownColor, label: 'قبراير 55%'),
        LegendItem(color: AppPallete.greyColor, label: 'مارس 15%'),
        LegendItem(color: AppPallete.brownColor, label: 'ابريل 57%'),
        LegendItem(color: AppPallete.primaryColor, label: 'مايو 62%'),
      ],
    );
  }

  Widget _buildCostDistributionCard() {
    return SizedBox(
      child: InsightCard(
        title: 'توزيع تكاليف الإنتاج والمصاريف الإدارية',
        chart: SizedBox(
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              startDegreeOffset: 70,
              centerSpaceRadius: 0,
              sections: [
                _buildPieSection(50, AppPallete.darkBrownColor, radius: 100),
                _buildPieSection(20, AppPallete.greyColor, radius: 100),
                _buildPieSection(10, AppPallete.brownColor, radius: 100),
                _buildPieSection(10, AppPallete.lightBrownColor, radius: 100),
                _buildPieSection(10, AppPallete.primaryColor, radius: 100),
              ],
            ),
          ),
        ),
        legendItems: const [
          LegendItem(
            color: AppPallete.darkBrownColor,
            label: 'مواد خام : 25000 جنيه',
          ),
          LegendItem(
            color: AppPallete.greyColor,
            label: 'أجور العمال : 1000 جنيه',
          ),
          LegendItem(
            color: AppPallete.lightBrownColor,
            label: 'استهلاك معدات وصيانة : 5000 جنيه',
          ),
          LegendItem(
            color: AppPallete.primaryColor,
            label: 'مصروفات إدارية : 5000 جنيه',
          ),
          LegendItem(
            color: AppPallete.brownColor,
            label: 'نقل وانتقالات : 5000 جنيه',
          ),
        ],
      ),
    );
  }

  Widget _buildProductionEfficiencyCard() {
    return InsightCard(
      title: 'كفاءة الإنتاج : اخر 3 عمليات إنتاج',
      chart: PieChart(
        PieChartData(
          sectionsSpace: 10,
          sections: [
            _buildPieSection(80, AppPallete.darkBrownColor, isBig: true),
            _buildPieSection(10, AppPallete.brownColor, isBig: true),
            _buildPieSection(10, AppPallete.lightBrownColor, isBig: true),
          ],
        ),
      ),
      legendItems: const [
        LegendItem(
          color: AppPallete.darkBrownColor,
          label: 'منتج 1 : مكتمل في الموعد : 40 طلب',
        ),
        LegendItem(
          color: AppPallete.brownColor,
          label: 'منتج 2 : تأخر يوم واحد : 5 طلب',
        ),
        LegendItem(
          color: AppPallete.lightBrownColor,
          label: 'منتج 3 : مكتمل في الموعد : 5 طلب',
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return [
      _barGroup(4, 6, AppPallete.primaryColor),
      _barGroup(3, 5.5, AppPallete.brownColor),
      _barGroup(2, 1.5, AppPallete.greyColor),
      _barGroup(1, 5.7, AppPallete.lightBrownColor),
      _barGroup(0, 6.2, AppPallete.darkBrownColor),
    ];
  }

  BarChartGroupData _barGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 40,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const months = ['يناير', 'فبراير', 'مارس', 'ابريل', 'مايو'];
    if (value.toInt() >= 0 && value.toInt() < months.length) {
      return Text(months[value.toInt()]);
    }
    return const SizedBox.shrink();
  }

  PieChartSectionData _buildPieSection(
    double value,
    Color color, {
    bool isBig = false,
    double? radius,
  }) {
    return PieChartSectionData(
      radius: radius,
      value: value,
      color: color,
      title: '${value.toInt()}%',
      titleStyle:
          isBig
              ? AppTextStyles.font16WhiteSemiBold
              : AppTextStyles.font14WhiteSemiBold,
    );
  }
}
