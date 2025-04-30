import 'package:flutter/material.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/home/view/widgets/notification_item.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => const VerticalSpacing(height: 10),
        itemBuilder:
            (context, index) => NotificationItem(
              title: 'تنبيه: كمية القماش منخفضة (50 متر متبقي).',
              iconPath: AssetsManager.info,
            ),
        shrinkWrap: true,
      ),
    );
  }
}
