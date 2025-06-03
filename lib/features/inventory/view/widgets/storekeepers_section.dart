import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_storekeeper_dialog.dart';

class StorekeepersSection extends StatelessWidget {
  const StorekeepersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
