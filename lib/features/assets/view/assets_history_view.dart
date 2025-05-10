import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/assets/view/widgets/add_new_assets_account_dialog.dart';

class AssetsHistoryView extends StatelessWidget {
  const AssetsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'سجل حسابات الأصول',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'تاريخ اليوم: 20250315',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              const SearchWithActions(),
            ],
          ),
          const VerticalSpacing(40),
          DynamicTable(
            rowData: List.generate(
              7,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'كود مجموعة الأصول': const TableCustomText('12345'),
                'كود الاصل': const TableCustomText('12345'),
                'اسم الأصل': const TableCustomText('اسم الأصل'),
                'اسم محموعة الأصل': const TableCustomText('اسم محموعة الأصل'),
                'رقم فاتورة الشراء': const TableCustomText('12345'),
                'سعر شراء الأصل': const TableCustomText('100'),
                'تاريخ الشراء': const TableCustomText('21/07/2023'),
                'العمر التفديري بالسنين': const TableCustomText('12'),
                'العمر التقديري بالأيام': const TableCustomText('1890'),
                'معدل الإستهلاك اليومي': const TableCustomText('100'),
                'عدد الأيام المنقضية': const TableCustomText('100'),
                'قيمة الإستهلاك حتى اليوم': const TableCustomText('100'),
                'القيمة الدفترية الصافية لحد اليوم': const TableCustomText(
                  '100',
                ),
              },
            ),
          ),
          const VerticalSpacing(30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              const Text(
                'ملخص الأصول',
                style: AppTextStyles.font16BlackSemiBold,
              ),
              Text(
                'إجمالي المبلغ القابل للإهلاك: 9282732617 ج م',
                style: AppTextStyles.font12GreyRegular,
              ),
              Text(
                'إجمالي معدل الإهلاك اليومي: 6116 ج م',
                style: AppTextStyles.font12GreyRegular,
              ),
              Text(
                'إجمالي قيمة الإهلاك حتى اليوم: 63681361 ج م',
                style: AppTextStyles.font12GreyRegular,
              ),
              Text(
                'القيمة الدفترية الصافية حتى اليوم: 8282901 ج م',
                style: AppTextStyles.font12GreyRegular,
              ),
            ],
          ),
          const VerticalSpacing( 20),
          AppCustomButton(
            title: 'إضافة حساب',
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AddNewAssetsAccountDialog(),
              );
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
