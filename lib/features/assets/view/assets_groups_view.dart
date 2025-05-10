import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/assets/view/widgets/add_new_assets_group_dialog.dart';

class AssetsGroupsView extends StatelessWidget {
  const AssetsGroupsView({super.key});

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
              Text('مجموعات الأصول', style: AppTextStyles.font16BlackSemiBold),
              Spacer(),
              SearchWithActions(),
            ],
          ),

          const VerticalSpacing(40),
          DynamicTable(
            tableWidth: context.width * 0.7,
            rowData: List.generate(
              6,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'كود مجموعة الأصول': const TableCustomText('12345'),
                'اسم حساب الأصول': const TableCustomText('ماكينات'),
                'وصف مجموعة الأصول': const TableCustomText(
                  'هذا الأصل يحتوي على كافة أصول المنشئات من مباني المصنع و الإدارة و م...',
                ),
                '': IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline, color: Colors.black),
                ),
                ' ': IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AddNewAssetsGroupDialog(),
                    );
                  },
                  icon: const Icon(Icons.edit, color: Colors.black),
                ),
              },
            ),
          ),
          const VerticalSpacing(20),
          AppCustomButton(
            title: 'إضافة مجموعة أصول جديدة',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddNewAssetsGroupDialog(),
              );
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
