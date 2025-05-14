import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/clients/view/widgets/add_transaction_dialog.dart';

class ClientStatementView extends StatelessWidget {
  const ClientStatementView({super.key});

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
                    'محل ملابس الأميرة - كشف حساب العميل',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'كود العميل: 019910',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              const SearchWithActions(),
            ],
          ),
          const VerticalSpacing(40),
          const Text('بيانات العميل', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(20),
          SizedBox(
            width: context.width * 0.4,
            child: const Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'نوع العميل',
                    hintText: 'شركة',
                    isRequired: false,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'رقم هاتف العميل',
                    hintText: '01100126436 - 01001010890',
                    isRequired: false,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'أسم ممثل العميل',
                    hintText: 'محمد حسونة',
                    isRequired: false,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(10),
          AppCustomTextField(
            label: 'عنوان العميل',
            isRequired: false,
            width: context.width * .265,
            hintText: '55 الأزبكية شارع محمد حسن المتفرع من شارع الشراباتلي',
            titleFontSize: 14,
            fillColor: Colors.white,
          ),
          const VerticalSpacing(40),
          const Text(
            'جميع المعاملات',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(20),
          DynamicTable(
            rowData: List.generate(
              5,
              (_) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'نوع المعاملة': const TableCustomText('دفعة فورية'),
                'رقم الفاتورة': const TableCustomText('5633222236'),
                'تاريخ المعاملة': const TableCustomText('1   2/10/2024'),
                'المبلغ الآجل': const TableCustomText('6,000'),
                'المبلغ المسدد': const TableCustomText('70,000'),
                'الرصيد المستحق': const TableCustomText(
                  '16,000',
                  color: Colors.red,
                ),
                'رصيد الشركة': const TableCustomText('70,000'),
                'طريقة التسلم': const TableCustomText('تحويل بنكي'),
              },
            ),
          ),
          const VerticalSpacing(40),
          AppCustomButton(
            title: 'إضافة معاملة',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddTransactionDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
