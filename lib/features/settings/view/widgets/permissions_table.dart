import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/settings/view/widgets/add_user_dialog.dart';

class PermissionsTable extends StatelessWidget {
  const PermissionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الصلاحيات والأدوار',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        const VerticalSpacing(20),
        DynamicTable(
          tableWidth: context.width * 0.6,
          rowData: List.generate(
            6,
            (index) => {
              'المستخدم': const TableCustomText('عبدالله عبدالله'),
              'البريد الإلكتروني': const TableCustomText('T6h6S@example.com'),
              'الأقسام المفتوحة': const TableCustomText('كل الأقسام'),
              'الإجراءات': Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppPallete.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 14,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddUserDialog(),
                      );
                    },
                    icon: TableCustomIcon(
                      AssetsManager.edit,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0XFFAD0A0A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 14,
                      ),
                    ),
                    onPressed: () {},
                    icon: TableCustomIcon(
                      AssetsManager.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            },
          ),
        ),
      ],
    );
  }
}
