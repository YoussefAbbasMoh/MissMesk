import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/job_orders/view/widgets/new_job_order_dialog.dart';

class JobOrdersHistoryView extends StatelessWidget {
  const JobOrdersHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('سجل أوامر الشغل', style: AppTextStyles.font16BlackSemiBold),
              Spacer(),
              SearchWithActions(),
            ],
          ),
          const VerticalSpacing(40),
          DynamicTable(
            rowData: List.generate(
              7,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'كود أمر الشغل': const TableCustomText('12345'),
                'تاريخ التشغيل': const TableCustomText('21/07/2023'),
                'مدة الإنتاج (باليوم)': const TableCustomText('20'),
                'تاريخ التوريد': const TableCustomText('21/07/2023'),
                'كمية الطلبية': const TableCustomText('100'),
                'الوحدة': const TableCustomText('دستة'),
                'نوع المنتج': const TableCustomText('بيجامة'),
                'المفاسات المطلوبة': const TableCustomText('XL , L , M , S'),
                'التكلفة التقديرية (ج.م)': const TableCustomText('7200'),
                'حالة أمر الشغل': const TableCustomText('جديد'),
                '': InkWell(
                  onTap: () {
                    context.go(
                      '${AppRoutes.jobOrderDetails}?jobOrderId=أمر الشغل 8726099&mainIndex=${context.queryParam('mainIndex')}&subIndex=${context.queryParam('subIndex')}',
                    );
                  },
                  child: TableCustomIcon(AssetsManager.linkOut),
                ),
              },
            ),
          ),
          const VerticalSpacing(20),
          AppCustomButton(
            title: 'إنشاء أمر شغل جديد',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const NewJobOrderDialog(),
              );
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
