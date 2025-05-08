import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

// ignore: must_be_immutable
class AddNewInventoryDialog extends StatefulWidget {
  const AddNewInventoryDialog({super.key});

  @override
  State<AddNewInventoryDialog> createState() => _AddNewInventoryDialogState();
}

class _AddNewInventoryDialogState extends State<AddNewInventoryDialog> {
  final TextEditingController shelfNameController = TextEditingController();

  List<String> shelfNames = [];

  void addShelfName() {
    if (shelfNameController.text.isNotEmpty) {
      shelfNames.add(shelfNameController.text);
      shelfNameController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة مخزن',
      iconPath: AssetsManager.management,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('بيانات المخزن', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(height: 20),
          const Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'رقم المخزن',
                  hintText: 'أضف رقم المخزن',
                  isRequired: false,
                  titleFontSize: 14,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'اسم المخزن',
                  hintText: 'أضف اسم المخزن',
                  isRequired: false,
                  titleFontSize: 14,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'عنوان المخزن',
                  hintText: 'أضف عنوان المخزن',
                  isRequired: false,
                  titleFontSize: 14,
                ),
              ),
            ],
          ),
          const VerticalSpacing(height: 20),
          const Text('بيانات الرفوف', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(height: 20),
          Row(
            spacing: 20,
            children: [
              const Flexible(
                child: AppCustomTextField(
                  label: 'عدد الرفوف',
                  hintText: 'ضع عدد الرفوف',
                  isRequired: false,
                  titleFontSize: 14,
                ),
              ),
              Flexible(child: Container()),
              Flexible(child: Container()),
            ],
          ),
          AppCustomTextField(
            label: 'أسماء الرفوف',
            hintText: 'اكتب اسم او كود الرف',
            isRequired: false,
            width: context.width * 0.3,
            controller: shelfNameController,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  addShelfName();
                },
                style: IconButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  backgroundColor: AppPallete.primaryColor,
                ),
                icon: const Icon(Icons.add, color: AppPallete.whiteColor),
              ),
            ),
          ),
          const VerticalSpacing(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            runAlignment: WrapAlignment.start,
            children: List.generate(
              shelfNames.length,
              (index) => Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppPallete.lightGreyColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(shelfNames[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
