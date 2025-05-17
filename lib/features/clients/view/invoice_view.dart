import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/search_with_result.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/clients/view/widgets/add_item_in_invoice_dialog.dart';
import 'package:miss_misq/features/providers/view/widgets/add_new_item_dialog.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

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
              Text(
                'فاتورة رقم 98732897 ',
                style: AppTextStyles.font16BlackSemiBold,
              ),
              Spacer(),
              SearchWithActions(),
            ],
          ),
          const VerticalSpacing(20),
          AppCustomTextField(
            label: 'وصف الطلبية',
            hintText: 'لا يوجد وصف',
            isRequired: false,
            titleFontSize: 14,
            fillColor: Colors.white,
            width: context.width * 0.5,
            minLines: 3,
          ),
          const VerticalSpacing(40),
          const Text(
            'بيانات الطلبية',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(20),
          SizedBox(
            width: context.width * 0.4,
            child: const Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'تاريخ الطلب',
                    isRequired: false,
                    titleFontSize: 14,
                    fillColor: Colors.white,
                    hintText: '27/02/2025',
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'تاريخ التسليم',
                    isRequired: false,
                    titleFontSize: 14,
                    fillColor: Colors.white,
                    hintText: '27/02/2025',
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'عدد الأقساط',
                    isRequired: false,
                    titleFontSize: 14,
                    fillColor: Colors.white,
                    hintText: '13',
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          SearchWithResult(
            items: const ['قطن ناعم', 'قماش عالي الجودة', 'قماش كتان'],
            title: 'المنتجات المطلوبة',
            hintText: 'بحث بإسم او كود الصنف',
            onItemSelected: (value) {
              showDialog(
                context: context,
                builder: (context) => const AddItemInInvoiceDialog(),
              );
            },
            onAddNewItem: () {
              showDialog(
                context: context,
                builder: (context) => const AddNewItemDialog(),
              );
            },
          ),
          const VerticalSpacing(20),
          DynamicTable(
            rowData: List.generate(
              5,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'كود المنتج': const TableCustomText('1234'),
                'اسم المنتج': const TableCustomText('أتواب حرير مزركش ورود'),
                'الوحدة': const TableCustomText('متر'),
                'سعر الوحدة (ج)': const TableCustomText('50'),
                'العدد': const TableCustomText('87'),
                'إجمالي القيمة (ج)': const TableCustomText('4000'),
              },
            ),
          ),
          const VerticalSpacing(20),
          SizedBox(
            width: context.width * .3,
            child: const Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'ضريبة القيمة المضافة',
                    hintText: '14%',
                    titleFontSize: 14,
                    fillColor: Colors.white,
                    isRequired: false,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'القيمة',
                    hintText: '57899',
                    fillColor: Colors.white,
                    titleFontSize: 14,
                    isRequired: false,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          const Text(
            'إجمالي قيمة الفاتورة',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(5),
          Text(
            'إجمالي قيمة الفاتورة: 75,000 ج. م',
            style: AppTextStyles.font12GreyRegular,
          ),
          const VerticalSpacing(20),
          AppCustomButton(
            title: 'تحرير الفاتورة',
            onPressed: () {},
            color: AppPallete.greyColor,
          ),
        ],
      ),
    );
  }
}
