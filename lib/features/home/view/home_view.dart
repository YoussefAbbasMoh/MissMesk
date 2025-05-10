import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/home/view/widgets/analytics_section.dart';
import 'package:miss_misq/features/home/view/widgets/inventory_and_production_section.dart';
import 'package:miss_misq/features/home/view/widgets/notifications_section.dart';
import 'package:miss_misq/features/home/view/widgets/statistics_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        StatisticsWidget(),
        VerticalSpacing(20),
        InventoryAndProductionSection(),
        VerticalSpacing(20),
        Text('الإشعارات والتنبيهات', style: AppTextStyles.font18BlackRegular),
        VerticalSpacing(10),
        NotificationsSection(),
        VerticalSpacing(30),
        Text('التقارير والتحليلات', style: AppTextStyles.font18BlackRegular),
        VerticalSpacing(10),
        AnalyticsSection(),
      ],
    );
  }
}
