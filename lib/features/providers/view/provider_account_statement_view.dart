import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/providers/view/widgets/paying_due_expenses_dialog.dart';

class ProviderAccountStatementView extends StatelessWidget {
  const ProviderAccountStatementView({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  const Text(
                    'شركة الأندلس للأقمشة - كشف حساب المورد',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'كود المورد : 09669',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              const SearchWithActions(),
            ],
          ),
          const VerticalSpacing(40),
          const Text('بيانات المورد', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(10),
          SizedBox(
            width: context.width * 0.6,
            child: const Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'اسم ممثل التوريدات',
                    hintText: 'اسم ممثل التوريدات',
                    isRequired: false,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'رقم هاتف المورد',
                    hintText: '01100126436 - 01001010890',
                    fillColor: Colors.white,
                    isRequired: false,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: AppCustomTextField(
                    label: 'عنوان المورد',
                    hintText:
                        '55 الأزبكية شارع محمد حسن المتفرع من شارع الشراباتلي',
                    fillColor: Colors.white,
                    isRequired: false,
                    titleFontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          SizedBox(
            width: context.width * 0.4,
            child: const Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'نشاط المورد',
                    hintText: 'خامات',
                    isRequired: false,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'نوع التوريدات',
                    hintText: 'أقمشة',
                    fillColor: Colors.white,
                    isRequired: false,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'إجمالي التوريدات',
                    hintText: '72',
                    fillColor: Colors.white,
                    isRequired: false,
                    titleFontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          const Text(
            'جميع المعاملات',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(20),
          DynamicTable(
            rowData: List.generate(
              4,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'وصف العملية': const TableCustomText('وصف العملية'),
                'رقم الفاتورة': const TableCustomText('12345'),
                'رقم إذن الصرف': const TableCustomText('12345'),
                'تاريخ المعاملة': const TableCustomText('21/07/2023'),
                'المبلغ المستحق': const TableCustomText('100'),
                'المبلغ المدفوع': const TableCustomText('100'),
                'الرصيد المستحق': const TableCustomText('100'),
                'طريقة الدفع': const TableCustomText('طريقة الدفع'),
              },
            ),
          ),
          const VerticalSpacing(20),
          AppCustomButton(
            title: 'سداد مصروفات مستحقة',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const PayingDueExpensesDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}

