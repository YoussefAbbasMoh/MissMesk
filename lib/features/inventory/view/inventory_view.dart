import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_item_dialog.dart';
import 'package:miss_misq/features/inventory/view/widgets/drop_down_filter.dart';
import 'package:miss_misq/features/inventory/view/widgets/products_filter.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final row = {
      'الرقم التسلسلي': const TableCustomText('1'),
      'كود الصنف': const TableCustomText('01926'),
      'اسم الصنف': const TableCustomText('اسم الصنف'),
      'الوحدة': const TableCustomText('الوحدة'),
      'الكمية الدفترية': const TableCustomText('الكمية الدفترية'),
      '': InkWell(
        onTap: () {
          context.go('${AppRoutes.itemCardBase}?itemId=بطاقة مخزون صنف 89235');
        },
        child: SvgPicture.asset(
          AssetsManager.linkOut,
          height: 30,
          fit: BoxFit.fill,
        ),
      ),
    };
    return Align(
      alignment: Alignment.topRight,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductsFilter(
                  filters: ['الكل', 'المواد الخام', 'المنتجات المكتملة'],
                ),
                SearchWithActions(),
              ],
            ),
            const VerticalSpacing(40),
            const Wrap(
              spacing: 40,
              runSpacing: 20,
              alignment: WrapAlignment.start,
              children: [
                DropDownFilter(
                  title: 'اسم المخزن',
                  items: ['مخزن السلام', 'مخزن مدينة نصر', 'مخزن التجمع'],
                ),
                DropDownFilter(
                  title: 'اسم المخزن',
                  items: ['مخزن السلام', 'مخزن مدينة نصر', 'مخزن التجمع'],
                ),
                DropDownFilter(
                  title: 'اسم المخزن',
                  items: ['مخزن السلام', 'مخزن مدينة نصر', 'مخزن التجمع'],
                ),
                DropDownFilter(
                  title: 'اسم المخزن',
                  items: ['مخزن السلام', 'مخزن مدينة نصر', 'مخزن التجمع'],
                ),
              ],
            ),
            const VerticalSpacing(40),
            DynamicTable(rowData: [row, row, row, row, row, row, row, row]),
            const VerticalSpacing(20),
            AppCustomButton(
              title: 'اضافة صنف',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const AddItemDialog(),
                );
              },
              icon: Icons.add,
            ),
          ],
        ),
      ),
    );
  }
}
