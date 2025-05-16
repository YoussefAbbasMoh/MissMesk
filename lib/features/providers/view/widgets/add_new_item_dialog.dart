import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';

class AddNewItemDialog extends StatelessWidget {
  const AddNewItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'اضافة صنف جديد',
      children: [
        const Text('بيانات المخزن', style: AppTextStyles.font16BlackSemiBold),
        const Text('نوع المخزن', style: AppTextStyles.font16BlackRegular),
        Row(
          spacing: 10,
          children: [
            _buildDialogButton('مواد خام', storeType: 'مواد خام'),
            _buildDialogButton('منتجات مكتملة', storeType: 'مواد خام'),
          ],
        ),
        const Row(
          spacing: 20,
          children: [
            Flexible(
              child: DropdownTextFieldWithTitle(
                title: 'نوع المنتج',
                items: ['منتج مكتمل', 'منتج خام'],
                hintText: 'اختر نوع المنتج',
                value: 'منتج مكتمل',
              ),
            ),
            Flexible(
              child: DropdownTextFieldWithTitle(
                title: 'المخزن',
                items: ['مخزن مدينة نصر', 'مخزن السلام'],
                hintText: 'اختر اسم المخزن',
                value: 'مخزن مدينة نصر',
              ),
            ),
            Flexible(
              child: DropdownTextFieldWithTitle(
                title: 'الرف',
                items: ['رف 1', 'رف 2', 'رف 3'],
                hintText: 'أختر الرف',
                value: 'رف 1',
              ),
            ),
          ],
        ),
        const Text('بيانات الصنف', style: AppTextStyles.font16BlackSemiBold),
        const Row(
          spacing: 20,
          children: [
            Flexible(
              child: AppCustomTextField(
                label: 'اسم الصنف',
                hintText: 'اسم الصنف',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
            Flexible(
              child: AppCustomTextField(
                label: 'كود الصنف',
                hintText: 'كود الصنف',
                titleFontSize: 14,
                isRequired: false,
              ),
            ),
            Flexible(
              child: DropdownTextFieldWithTitle(
                title: 'وحدة الشراء',
                items: ['متر', 'كيلو', 'جرام'],
                hintText: 'اختر وحدة الشراء',
                value: 'متر',
              ),
            ),
          ],
        ),
        AppCustomTextField(
          label: 'حد الطلب',
          hintText: '24',
          titleFontSize: 14,
          isRequired: false,
          width: context.width * 0.14,
        ),
        Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'كود الكمية التلقائي',
              style: AppTextStyles.font16BlackSemiBold,
            ),
            Text(
              'كود المنتج: 0102830',
              style: AppTextStyles.font14BlackRegular.copyWith(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  AppCustomButton _buildDialogButton(
    final String title, {
    required String storeType,
  }) {
    return AppCustomButton(
      title: title,
      borderRadius: 5,
      fontSize: 14,
      color:
          storeType == title ? AppPallete.primaryColor : Colors.grey.shade200,
      titleColor: storeType == title ? Colors.white : Colors.black,
      onPressed: () {},
    );
  }
}
