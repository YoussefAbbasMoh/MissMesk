import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';

class AnotherExpenses extends StatelessWidget {
  const AnotherExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 40,
      children: [
        const Text('مصروفات أخرى', style: AppTextStyles.font16BlackSemiBold),
        SizedBox(
          width: context.width * 0.5,
          child: Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Flexible(
                child: AppCustomTextField(
                  label: 'اسم المصروف',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: 'اسم المصروف',
                ),
              ),
              const Flexible(
                child: AppCustomTextField(
                  label: 'إجمالي قيمة المصروف',
                  titleFontSize: 14,
                  isRequired: false,
                  fillColor: Colors.white,
                  hintText: 'قيمة المصروف',
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppPallete.primaryColor,
                  padding: const EdgeInsets.all(16),
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {},
                child: const Text(
                  '+',
                  style: AppTextStyles.font24WhiteSemiBold,
                ),
              ),
            ],
          ),
        ),
        DynamicTable(
          tableWidth: context.width * 0.4,
          rowData: List.generate(
            3,
            (index) => {
              'الرقم التسلسلي': const TableCustomText('1'),
              'اسم المصروف': const TableCustomText('اسم المصروف'),
              'إجمالي قيمة المصروف (ج.م)': const TableCustomText(
                'قيمة المصروف',
              ),
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
      ],
    );
  }
}
