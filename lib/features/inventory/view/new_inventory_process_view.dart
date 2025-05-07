import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/inventory/view/widgets/new_item_inventory_dialog.dart';

class NewInventoryProcessView extends StatelessWidget {
  const NewInventoryProcessView({super.key});

  @override
  Widget build(BuildContext context) {
    final row = DataRow(
      cells: [
        const DataCell(Center(child: Text('1'))),
        const DataCell(Center(child: Text('11010234'))),
        const DataCell(
          Center(
            child: Text(
              'أتواب حرير مزركش ورد - أصفر كناري',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const DataCell(Center(child: Text('متر'))),
        const DataCell(Center(child: Text('350'))),
        const DataCell(Center(child: Text('324'))),
        const DataCell(Center(child: Text('12350'))),
        const DataCell(Center(child: Text('بواقي'))),
        DataCell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const NewItemInventoryDialog(),
            );
          },
          const Center(child: Icon(Icons.edit)),
        ),
      ],
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'عملية جرد جديدة',
            style: AppTextStyles.font20BlackSemiBold,
          ),
          const VerticalSpacing(height: 10),
          Text(
            'تاريخ بدأ الجرد: 21/07/2023',
            style: AppTextStyles.font12GreyRegular,
          ),
          const VerticalSpacing(height: 40),
          const Text('بيانات المخزن', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(height: 20),
          SizedBox(
            width: context.width * 0.5,
            child: Row(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: DropdownTextFieldWithTitle(
                    title: 'رقم المخزن',
                    items: const ['مخزن 1', 'مخزن 2', 'مخزن 3', 'مخزن 4'],
                    isRequired: true,
                    hintText: 'اختر رقم المخزن',
                    value: 'مخزن 1',
                    onChanged: (value) {},
                    fillColor: Colors.white,
                  ),
                ),
                Flexible(
                  child: DropdownTextFieldWithTitle(
                    title: 'رقم المخزن',
                    items: const ['مخزن 1', 'مخزن 2', 'مخزن 3', 'مخزن 4'],
                    isRequired: true,
                    hintText: 'اختر رقم المخزن',
                    value: 'مخزن 1',
                    onChanged: (value) {},
                    fillColor: Colors.white,
                  ),
                ),
                Flexible(
                  child: DropdownTextFieldWithTitle(
                    title: 'رقم المخزن',
                    items: const ['مخزن 1', 'مخزن 2', 'مخزن 3', 'مخزن 4'],
                    isRequired: true,
                    hintText: 'اختر رقم المخزن',
                    value: 'مخزن 1',
                    onChanged: (value) {},
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(height: 10),
          AppCustomButton(
            title: 'حفظ',
            onPressed: () {},
            width: context.width * 0.1,
          ),

          const VerticalSpacing(height: 20),
          const Text('عملية الجرد', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(height: 20),
          DynamicTable(
            columnNames: const [
              'الرقم التسلسلي',
              'رقم كود الصنف',
              'أسم الصنف',
              'الوحدة',
              'الكمية الدفترية',
              'الكمية الفعلية',
              'الفروق + -',
              'الحالة',
              '',
            ],
            rowData: [row, row, row, row, row],
          ),
          const VerticalSpacing(height: 20),
          AppCustomButton(
            title: 'جرد صنف جديد',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const NewItemInventoryDialog(),
              );
            },
          ),
          const VerticalSpacing(height: 60),
          Row(
            spacing: 30,
            children: [
              AppCustomButton(title: 'حفظ وإكمال لاحقاً', onPressed: () {}),
              AppCustomButton(
                title: 'إتمام عملية الجرد',
                onPressed: () {},
                color: AppPallete.whiteColor,
                titleColor: AppPallete.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
