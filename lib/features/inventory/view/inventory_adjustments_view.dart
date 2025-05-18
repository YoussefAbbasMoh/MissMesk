import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_new_inventory_dialog.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_storekeeper_dialog.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_unit_dialog.dart';
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
          DynamicTable(
            rowData: List.generate(
              4,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'رقم المخزن': const TableCustomText('12345'),
                'اسم المخزن': const TableCustomText('اسم المخزن'),
                'مكان المخزن': const TableCustomText(
                  'سوق العبور و امام كارفور، المنطقة الصناعية أ، قسم السلام شارع 40',
                ),
                'الرفوف': const TableCustomText('100'),
                '': InkWell(
                  child: TableCustomIcon(AssetsManager.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AddNewInventoryDialog(),
                    );
                  },
                ),
                ' ': InkWell(
                  child: TableCustomIcon(AssetsManager.delete),
                  onTap: () {},
                ),
              },
            ),
          ),
          const VerticalSpacing(10),
          Align(
            alignment: Alignment.centerLeft,
            child: AppCustomButton(
              title: 'إضافة مخزن',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AddNewInventoryDialog(),
                );
              },
              icon: Icons.add,
            ),
          ),
          const VerticalSpacing(40),
          SizedBox(
            width: context.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'سجل أمناء المخازن',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                const VerticalSpacing(10),
                DynamicTable(
                  rowData: List.generate(
                    4,
                    (index) => {
                      'الرقم التسلسلي': const TableCustomText('1'),
                      'اسم الأمين': const TableCustomText('اسم الأمين'),
                      'اسم المخزن': const TableCustomText('اسم المخزن'),
                      '': InkWell(
                        child: TableCustomIcon(AssetsManager.edit),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const AddStorekeeperDialog(),
                          );
                        },
                      ),
                      ' ': InkWell(
                        child: TableCustomIcon(AssetsManager.delete),
                        onTap: () {},
                      ),
                    },
                  ),
                ),
                const VerticalSpacing(10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppCustomButton(
                    title: 'إضافة أمين',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddStorekeeperDialog(),
                      );
                    },
                    icon: Icons.add,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(40),
          SizedBox(
            width: context.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'وحدات الأصناف',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                const VerticalSpacing(10),
                DynamicTable(
                  rowData: List.generate(
                    4,
                    (index) => {
                      'الرقم التسلسلي': const TableCustomText('1'),
                      'الوحدة': const TableCustomText('الوحدة'),
                      '': InkWell(
                        child: TableCustomIcon(AssetsManager.edit),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const AddUnitDialog(),
                          );
                        },
                      ),
                      ' ': InkWell(
                        child: TableCustomIcon(AssetsManager.delete),
                        onTap: () {},
                      ),
                    },
                  ),
                ),
                const VerticalSpacing(10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppCustomButton(
                    title: 'إضافة وحدة',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddUnitDialog(),
                      );
                    },
                    icon: Icons.add,
                  ),
                ),
              ],
            ),
          ),
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
