import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/search_with_result.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/clients/view/widgets/add_item_in_invoice_dialog.dart';
import 'package:miss_misq/features/job_orders/view/widgets/another_expenses.dart';
import 'package:miss_misq/features/job_orders/view/widgets/cost_summary.dart';
import 'package:miss_misq/features/job_orders/view/widgets/job_order_data.dart';
import 'package:miss_misq/features/job_orders/view/widgets/supply_to_warehouse_dialog.dart';
import 'package:miss_misq/features/providers/view/widgets/add_new_item_dialog.dart';

class JobOrderDetailsView extends StatelessWidget {
  const JobOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أمر الشغل رقم 28971620',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'كود أمر الشغل: 28971620',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              const SearchWithActions(),
            ],
          ),

          const JobOrderData(),

          SearchWithResult(
            items: const ['قطن ناعم', 'قماش عالي الجودة', 'قماش كتان'],
            title: 'الخامات المستخدمة',
            hintText: 'بحث يأسم أو كود الصنف',
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

          DynamicTable(
            tableWidth: context.width * 0.7,
            rowData: List.generate(
              3,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'كود الصنف': const TableCustomText('12345'),
                'اسم الصنف': const TableCustomText('أتواب حرير مزركش ورود'),
                'الوحدة': const TableCustomText('متر'),
                'سعر الوحدة (ج)': const TableCustomText('100'),
                'الكمية المستخدمة': const TableCustomText('100'),
                'إجمالي القيمة (ج.م)': const TableCustomText('1000'),
                '': InkWell(
                  onTap: () {},
                  child: TableCustomIcon(AssetsManager.delete),
                ),
                ' ': InkWell(
                  onTap: () {},
                  child: TableCustomIcon(AssetsManager.edit),
                ),
              },
            ),
          ),

          SearchWithResult(
            items: const ['قطن ناعم', 'قماش عالي الجودة', 'قماش كتان'],
            title: 'إهلاك الأصول الثابتة',
            hintText: 'بحث يأسم أو كود الأصل',
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

          DynamicTable(
            tableWidth: context.width * 0.7,
            rowData: List.generate(
              3,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'كود الأصل': const TableCustomText('12345'),
                'اسم الأصل': const TableCustomText('أتواب حرير مزركش ورود'),
                'قيمة الإهلاك اليومي (ج.م)': const TableCustomText('1200'),
                'إجمالي قيمة الإهلاك (ج)': const TableCustomText('2500'),
                '': InkWell(
                  onTap: () {},
                  child: TableCustomIcon(AssetsManager.delete),
                ),
                ' ': InkWell(
                  onTap: () {},
                  child: TableCustomIcon(AssetsManager.edit),
                ),
              },
            ),
          ),

          const VerticalSpacing(20),
          const AnotherExpenses(),
          const VerticalSpacing(20),

          const CostSummary(),
          const VerticalSpacing(10),

          AppCustomButton(
            title: 'توريد للمخزن',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const SupplyToWarehouseDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
