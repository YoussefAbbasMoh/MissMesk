import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String storeType = 'مواد خام';
  String storeName = '';
  String shelfName = '';
  String purchaseUnit = '';

  late final TextEditingController itemNameController;
  late final TextEditingController reorderPointController;

  @override
  void initState() {
    itemNameController = TextEditingController();
    reorderPointController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'اضافة صنف',
      onSave: () {},
      iconPath: AssetsManager.management,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('بيانات المخزن', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(20),
          const Text('نوع المخزن', style: AppTextStyles.font16BlackRegular),
          const VerticalSpacing( 10),
          Row(
            spacing: 10,
            children: [
              _buildDialogButton('مواد خام'),
              _buildDialogButton('منتجات مكتملة'),
            ],
          ),
          const VerticalSpacing( 20),
          Row(
            spacing: 20,
            children: [
              Flexible(
                child: DropdownTextFieldWithTitle(
                  hintText: 'اختر اسم المخزن',
                  title: 'المخزن',
                  items: const ['مخزن 1', 'مخزن 2', 'مخزن 3', 'مخزن 4'],
                  value: storeName == '' ? 'مخزن 1' : storeName,
                  onChanged: (value) {
                    setState(() {
                      storeName = value;
                    });
                  },
                ),
              ),
              Flexible(
                child: DropdownTextFieldWithTitle(
                  hintText: 'اختر الرف',
                  title: 'الرف',
                  items: const ['رف 1', 'رف 2', 'رف 3', 'رف 4'],
                  value: shelfName == '' ? 'رف 1' : shelfName,
                  onChanged: (value) {
                    setState(() {
                      shelfName = value;
                    });
                  },
                ),
              ),
              const Flexible(child: SizedBox()),
            ],
          ),
          const VerticalSpacing(20),
          const Text('بيانات الصنف', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing( 10),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'اسم الصنف',
                  hintText: 'ادخل اسم الصنف',
                  titleFontSize: 14,
                  isRequired: false,
                  controller: itemNameController,
                ),
              ),
              Flexible(
                child: DropdownTextFieldWithTitle(
                  title: 'وحدة الشراء',
                  hintText: 'متر',
                  items: const ['متر', 'كيلو', 'جنيه', 'كيلو جنيه', 'كيلو متر'],
                  onChanged: (value) {
                    setState(() {
                      purchaseUnit = value;
                    });
                  },
                  value: purchaseUnit == '' ? 'متر' : purchaseUnit,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'حد الطلب',
                  hintText: '24',
                  titleFontSize: 14,
                  isRequired: false,
                  controller: reorderPointController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppCustomButton _buildDialogButton(final String title) {
    return AppCustomButton(
      title: title,
      borderRadius: 10,
      fontSize: 14,
      color:
          storeType == title ? AppPallete.primaryColor : Colors.grey.shade200,
      titleColor: storeType == title ? Colors.white : Colors.black,
      onPressed: () {
        setState(() {
          storeType = title;
        });
      },
    );
  }
}
