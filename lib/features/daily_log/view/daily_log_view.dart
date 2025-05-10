import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/daily_log/view/widgets/new_transaction_dialog.dart';

class DailyLogView extends StatelessWidget {
  const DailyLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('دفتر اليومية', style: AppTextStyles.font16BlackSemiBold),
              Spacer(),
              SearchWithActions(),
            ],
          ),

          const VerticalSpacing(40),
          DynamicTable(
            rowData: List.generate(
              6,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'تاريخ المعاملة': const TableCustomText('21/07/2023'),
                'رقم الفاتورة': const TableCustomText('12345'),
                'اسم المستفيد': const TableCustomText('اسم المستفيد'),
                'مدين (تسلم نقدية)': const TableCustomText('100'),
                'دائن (صرف نقدية)': const TableCustomText('100'),
                'الرصيد': const TableCustomText('100'),
                'طريقة الدفع': const TableCustomText('طريقة الدفع'),
                'ملاحظات': const TableCustomText('ملاحظات'),
              },
            ),
          ),
          const VerticalSpacing(20),
          AppCustomButton(
            title: 'إنشاء معاملة جديدة',
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const NewTransactionDialog(),
              );
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
