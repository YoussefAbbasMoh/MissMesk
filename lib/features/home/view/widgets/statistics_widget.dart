import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/home/view/widgets/statistic_card.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 46),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الإحصائيات العامة',
                style: AppTextStyles.font20BlackSemiBold,
              ),
              VerticalSpacing(height: 10),
              Text(
                'هنا يمكنك الاطلاع على أهم المؤشرات المالية والإدارية التي تلخص أداء العمل خلال الفترة الحالية.',
                style: AppTextStyles.font14BlackRegular,
              ),
              VerticalSpacing(height: 20),
              Row(
                spacing: 10,
                children: [
                  StatisticCard(
                    title: 'إجمالي الإيرادات',
                    amount: '50,000 جنيه',
                  ),
                  StatisticCard(
                    title: 'إجمالي المصروفات',
                    amount: '30,000 جنية',
                  ),
                  StatisticCard(title: 'أوامر الإنتاج الحالية', amount: '15'),
                  StatisticCard(title: 'الفواتير المستحقة للدفع', amount: '4'),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            AssetsManager.rightEllipse,
            width: 300,
            height: 150,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            AssetsManager.leftEllipse,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
