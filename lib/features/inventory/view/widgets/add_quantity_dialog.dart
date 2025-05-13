import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/switch_row.dart';

class AddQuantityDialog extends StatefulWidget {
  const AddQuantityDialog({super.key});

  @override
  State<AddQuantityDialog> createState() => _AddQuantityDialogState();
}

class _AddQuantityDialogState extends State<AddQuantityDialog> {
  bool isNewItem = true;
  bool isReturnedItem = false;
  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'اضافة كمية',
      iconPath: AssetsManager.management,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ItemInfoSection(),
          const VerticalSpacing(20),
          const Text(
            'بيانات عملية الإضافة',
            style: AppTextStyles.font20BlackSemiBold,
          ),
          const VerticalSpacing(20),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'الكمية المضافة',
                  hintText: 'أدخل الكمية المضافة',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'رقم إذن الإضافة',
                  isRequired: false,
                  hintText: 'أدخل أذن الإضافة',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                ),
              ),
              Flexible(
                child: DropdownTextFieldWithTitle(
                  onChanged: (value) {},
                  title: 'المورد',
                  items: const ['رقم 1', 'رقم 2', 'رقم 3', 'رقم 4'],
                  hintText: 'أختر أسم المورد',
                  value: 'رقم 1',
                ),
              ),
            ],
          ),
          const VerticalSpacing(10),
          Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: AppCustomTextField(
                  titleFontSize: 14,
                  label: 'مسئول التسجيل',
                  hintText: 'أدخل أسم مسئول التسجيل',
                  hintTextStyle: AppTextStyles.font14GreyRegular,
                ),
              ),
              const Flexible(child: SizedBox()),
              const Flexible(child: SizedBox()),
            ],
          ),
          const VerticalSpacing(20),
          AppCustomTextField(
            titleFontSize: 14,
            label: 'ملاحظات',
            isRequired: false,
            hintText: 'أضف ملاحظاتك',
            hintTextStyle: AppTextStyles.font14GreyRegular,
            minLines: 2,
          ),
          const VerticalSpacing(20),
          SwitchRow(
            label: 'كمية مرتجعة',
            value: isReturnedItem,
            onChanged: (value) {
              setState(() {
                isReturnedItem = value;
              });
            },
          ),
          const VerticalSpacing(20),
          if (isReturnedItem) const _ReturnedItemFields(),
          SwitchRow(
            label: 'كمية جديدة',
            value: isNewItem,
            onChanged: (value) {
              setState(() {
                isNewItem = value;
              });
            },
          ),
          const VerticalSpacing(20),
          if (isNewItem) const _NewItemFields(),
        ],
      ),
    );
  }
}

class _ItemInfoSection extends StatelessWidget {
  const _ItemInfoSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('بيانات الصنف', style: AppTextStyles.font16BlackSemiBold),
        VerticalSpacing(20),
        Row(
          spacing: 10,
          children: [
            Flexible(child: _ItemField(label: 'كود الصنف')),
            Flexible(child: _ItemField(label: 'اسم الصنف')),
            Flexible(child: _ItemField(label: 'نوع الصنف')),
            Flexible(child: _ItemField(label: 'الوحدة', hintText: 'متر')),
          ],
        ),
      ],
    );
  }
}

class _ItemField extends StatelessWidget {
  final String label;
  final String? hintText;

  const _ItemField({required this.label, this.hintText});

  @override
  Widget build(BuildContext context) {
    return AppCustomTextField(
      titleFontSize: 14,
      label: label,
      isRequired: false,
      hintText: hintText ?? 'ادخل $label',
      hintTextStyle: AppTextStyles.font14GreyRegular,
      fillColor: const Color(0XFFEDE0CC),
    );
  }
}

class _ReturnedItemFields extends StatelessWidget {
  const _ReturnedItemFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomTextField(
          titleFontSize: 14,
          width: context.width * 0.15,
          label: 'كود الكمية المرتجعة',
          hintText: 'أضف كود الكمية المرتجعة',
          hintTextStyle: AppTextStyles.font14GreyRegular,
        ),
        const VerticalSpacing(10),
        Text(
          'كود الكمية المرتجعة يتكون من: 019910XX',
          style: AppTextStyles.font12GreyRegular,
        ),
        const VerticalSpacing(30),
      ],
    );
  }
}

class _NewItemFields extends StatelessWidget {
  const _NewItemFields();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Flexible(
          child: AppCustomTextField(
            titleFontSize: 14,
            label: 'أضف سعر الكمية',
            hintText: 'أضف سعر شراء الأصل',
            hintTextStyle: AppTextStyles.font14GreyRegular,
          ),
        ),
        Flexible(
          child: DropdownTextFieldWithTitle(
            onChanged: (value) {},
            title: 'حدد الرف',
            items: const ['رقم 1', 'رقم 2', 'رقم 3', 'رقم 4'],
            hintText: 'اختر الرف',
            value: 'رقم 1',
            isRequired: true,
          ),
        ),
        Flexible(
          child: AppCustomTextField(
            titleFontSize: 14,
            label: 'كود الكمية الجديدة',
            isRequired: false,
            hintText: '01991027',
            hintTextStyle: AppTextStyles.font14GreyRegular,
          ),
        ),
      ],
    );
  }
}
