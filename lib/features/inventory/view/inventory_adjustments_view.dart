import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventories_section.dart';
import 'package:miss_misq/features/inventory/view/widgets/storekeepers_section.dart';
import 'package:miss_misq/features/inventory/view/widgets/untis_section.dart';
import 'package:miss_misq/features/inventory/view/widgets/upload_new_products_dialog.dart';

class InventoryAdjustmentsView extends StatelessWidget {
  const InventoryAdjustmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'إعدادات المخازن',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(40),
          const Text('سجل المخازن', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(10),
          const InventoriesSection(),
          const VerticalSpacing(40),
          const StorekeepersSection(),
          const VerticalSpacing(40),
          const AddUnitSection(),
          const VerticalSpacing(40),
          const Text(
            'التحكم بالمخزن',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(10),
          AppCustomButton(
            title: 'رفع أصناف جديدة',

            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const UploadNewProductsDialog(),
              );
            },
            icon: Icons.upload_outlined,
          ),
        ],
      ),
    );
  }
}
