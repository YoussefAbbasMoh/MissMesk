import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/home/models/legend_item_model.dart';

class InsightCard extends StatelessWidget {
  final String title;
  final Widget chart;
  final List<LegendItem> legendItems;

  const InsightCard({
    super.key,
    required this.title,
    required this.chart,
    required this.legendItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(20),
          SizedBox(height: 200, child: chart),
          const VerticalSpacing(20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children:
                legendItems
                    .map(
                      (item) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(height: 10, width: 40, color: item.color),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              item.label,
                              style: AppTextStyles.font14BlackRegular,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
