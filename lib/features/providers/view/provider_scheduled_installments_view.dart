import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';

class ProviderScheduledInstallmentsView extends StatelessWidget {
  const ProviderScheduledInstallmentsView({super.key});

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
                    'شركة الأندلس للأقمشة - الأقساط المجدولة',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'كود المورد : 12345',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              const SearchWithActions(),
            ],
          ),
          const VerticalSpacing(30),
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
          const VerticalSpacing(40),
          DynamicTable(
            tableWidth: context.width * 0.4,
            rowData: List.generate(
              7,
              (_) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'رقم الفاتورة': const TableCustomText('123444'),
                'رقم الدفعة': const TableCustomText('1'),
                'قيمة الدفعة': const TableCustomText('100'),
                'تاريخ الدفعة': const TableCustomText('21/07/2023'),
              },
            ),
          ),
        ],
      ),
    );
  }
}
