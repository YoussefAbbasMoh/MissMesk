import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/switch_row.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/providers/models/provider_model.dart';

class ProviderDetailsView extends StatelessWidget {
  const ProviderDetailsView({
    super.key,
    required this.providerName,
    required this.provider,
  });

  final String providerName;
  final ProviderModel provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(providerName, style: AppTextStyles.font16BlackSemiBold),
                  Text(
                    'كود المورد : ${provider.providerCode}',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              const SearchWithActions(),
            ],
          ),

          AppCustomTextField(
            width: context.width * .6,
            label: 'وصف المورد والتوريدات',
            isRequired: false,
            hintText: provider.description,
            fillColor: Colors.white,
            titleFontSize: 16,
            minLines: 2,
          ),
          const VerticalSpacing(20),
          const Text('بيانات المورد', style: AppTextStyles.font16BlackSemiBold),
          SizedBox(
            width: context.width * .6,
            child: Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'أسم ممثل التوريدات',
                    isRequired: false,
                    hintText: provider.providerRepresenter,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'رقم هاتف المورد',
                    isRequired: false,
                    hintText: provider.providerPhoneNumber,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'عنوان المورد',
                    isRequired: false,
                    hintText: provider.providerAddress,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.width * .5,
            child: Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'نشاط المورد',
                    isRequired: false,
                    hintText: provider.providerActivity,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'نوع التوريدات',
                    isRequired: false,
                    hintText: provider.providerType,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'إجمالي التوريدات',
                    isRequired: false,
                    hintText: provider.totalSupplies,
                    fillColor: Colors.white,
                    titleFontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            spacing: 20,
            children: [
              AppCustomButton(title: 'كشف حساب المورد', onPressed: () {}),
              AppCustomButton(
                title: 'كشف حساب المورد',
                onPressed: () {},
                color: Colors.white,
                titleColor: Colors.black,
              ),
            ],
          ),
          const Text('سجل الفواتير', style: AppTextStyles.font16BlackSemiBold),
          DynamicTable(
            rowData: List.generate(
              3,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'رقم الفاتورة': const TableCustomText('5633222236'),
                'تاريخ الطلب': const TableCustomText('12/10/2024'),
                'وصف الطلبية': const TableCustomText(
                  'تشمل 10 لفات قطن أبيض (150 سم × 50 م، 100% قطن، 180 جرام/م²)، 5 لفا',
                ),
                'المسئول عن الطلب': const TableCustomText('محمد جمعة'),
                'تاريخ التسلم': const TableCustomText('27/10/2024'),
                'إجمالي السعر': const TableCustomText('75000'),
                'طريقة الدفع': const TableCustomText('تحويل بنكي'),
                '': InkWell(
                  onTap: () {
                    context.go(
                      '${AppRoutes.providerDetails}?providerName=شركة+الحلول+الذكية',
                      extra: {'provider': providers[index]},
                    );
                  },
                  child: SvgPicture.asset(AssetsManager.linkOut, height: 25),
                ),
              },
            ),
          ),
          AppCustomButton(
            title: 'إضافة طلبية جديدة',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddNewOrderDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddNewOrderDialog extends StatelessWidget {
  const AddNewOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'إضافة طلبية جديدة',
      iconPath: AssetsManager.management,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          const Text('بيانات المورد', style: AppTextStyles.font16BlackSemiBold),
          const Row(
            spacing: 20,
            children: [
              Flexible(child: _ItemField(label: 'اسم المورد')),
              Flexible(child: _ItemField(label: 'كود المورد')),
              Flexible(child: _ItemField(label: 'اسم ممثل التوريدات')),
              Flexible(child: _ItemField(label: 'رقم هاتف المورد')),
            ],
          ),
          const Row(
            spacing: 20,
            children: [
              Flexible(child: _ItemField(label: 'نشاط المورد')),
              Flexible(child: _ItemField(label: 'نوع التوريدات')),
              Flexible(flex: 2, child: _ItemField(label: 'عنوان المورد')),
            ],
          ),
          const Text(
            'بيانات الطلبية',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const Row(
            spacing: 20,
            children: [
              Flexible(
                child: AppCustomTextField(
                  label: 'رقم الفاتورة',
                  hintText: 'أضف أسم الأصل',
                  titleFontSize: 14,
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'تاريخ الطلب',
                  titleFontSize: 14,

                  hintText: '00000000',
                  suffixIcon: Icon(
                    Icons.calendar_month_outlined,
                    color: AppPallete.lightGreyColor,
                  ),
                ),
              ),
              Flexible(
                child: AppCustomTextField(
                  label: 'تاريخ التسلم',
                  hintText: '00000000',
                  titleFontSize: 14,

                  suffixIcon: Icon(
                    Icons.calendar_month_outlined,
                    color: AppPallete.lightGreyColor,
                  ),
                ),
              ),
            ],
          ),
          AppCustomTextField(
            width: context.width * .15,
            label: 'المسئول عن الطلب',
            hintText: 'أضف أسم المسئول',
            isRequired: false,
            titleFontSize: 14,
          ),
          const Text(
            'البيانات المالية',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          AppCustomTextField(
            width: context.width * .15,
            label: 'إجمالي سعر الفاتورة',
            hintText: 'أضف أسم الأصل',
            titleFontSize: 14,
          ),
          const VerticalSpacing(10),
          SwitchRow(
            label: 'السداد على أقساط',
            value: true,
            onChanged: (value) {},
          ),
          AppCustomTextField(
            width: context.width * .15,
            label: 'اعداد الأقساط',
            hintText: 'أضف أعداد الأقساط',
            titleFontSize: 14,
          ),
          SizedBox(
            width: context.width * .3,
            child: Row(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Flexible(
                  child: AppCustomTextField(
                    label: 'قيمة القسط',
                    hintText: 'أضف قيمة القسط',
                    titleFontSize: 14,
                  ),
                ),
                const Flexible(
                  child: AppCustomTextField(
                    label: 'تاريخ سداد القسط',
                    titleFontSize: 14,
                    hintText: '00000000',
                    suffixIcon: Icon(
                      Icons.calendar_month_outlined,
                      color: AppPallete.lightGreyColor,
                    ),
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppPallete.greyColor,
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetsManager.minus),
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.width * .3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 20,
              children: [
                const Flexible(
                  child: AppCustomTextField(
                    label: 'قيمة القسط',
                    hintText: 'أضف قيمة القسط',
                    titleFontSize: 14,
                  ),
                ),
                const Flexible(
                  child: AppCustomTextField(
                    label: 'تاريخ سداد القسط',
                    titleFontSize: 14,
                    hintText: '00000000',
                    suffixIcon: Icon(
                      Icons.calendar_month_outlined,
                      color: AppPallete.lightGreyColor,
                    ),
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppPallete.primaryColor,
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Text(
                    '+',
                    style: AppTextStyles.font24WhiteSemiBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemField extends StatelessWidget {
  final String label;

  const _ItemField({required this.label});

  @override
  Widget build(BuildContext context) {
    return AppCustomTextField(
      titleFontSize: 14,
      label: label,
      isRequired: false,
      hintText: 'ادخل $label',
      hintTextStyle: AppTextStyles.font14GreyRegular,
      fillColor: const Color(0XFFEDE0CC),
    );
  }
}
