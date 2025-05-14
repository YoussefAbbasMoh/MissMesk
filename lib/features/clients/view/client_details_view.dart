import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/clients/view/widgets/add_new_customer_order_dialog.dart';

class ClientDetailsView extends StatelessWidget {
  const ClientDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  const Text(
                    'محل ملابس الأميرة',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'كود العميل: 019910',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                  Text(
                    'نوع العميل: شركة',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              const SearchWithActions(),
            ],
          ),
          const VerticalSpacing(20),
          AppCustomTextField(
            label: 'وصف العميل',
            isRequired: false,
            hintTextStyle: AppTextStyles.font14BlackRegular,
            hintText:
                'تتعاون مع المصنع لتوريد ملابس رجالية ونسائية بجودة عالية. يقع مقر الشركة في القاهرة، مصر، وتعمل في قطاع التجزئة والجملة. تتميز بطلبات دورية تشمل التيشيرتات، القمصان، والعباءات، مع متطلبات خاصة في الخامات والتطريز. يتم التعامل وفق عقود سنوية، مع شروط دفع مرنة وتسليم وفق جدول زمني محدد.',
            titleFontSize: 14,
            fillColor: Colors.white,
            minLines: 3,
            width: context.width * 0.5,
          ),
          const VerticalSpacing(20),
          const Text('بيانات العميل', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(20),
          SizedBox(
            width: context.width * 0.55,
            child: const Row(
              spacing: 20,
              children: [
                Flexible(
                  child: AppCustomTextField(
                    label: 'رقم هاتف العميل',
                    titleFontSize: 14,
                    hintText: '01096729827',
                    fillColor: Colors.white,
                    isRequired: false,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: AppCustomTextField(
                    label: 'عنوان العميل',
                    titleFontSize: 14,
                    hintText:
                        '55 الأزبكية شارع محمد حسن المتفرع من شارع الشراباتلي',
                    fillColor: Colors.white,
                    isRequired: false,
                  ),
                ),
                Flexible(
                  child: AppCustomTextField(
                    label: 'أسم ممثل العميل',
                    titleFontSize: 14,
                    hintText: 'أحمد حسن حسونة',
                    fillColor: Colors.white,
                    isRequired: false,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacing(20),
          Row(
            spacing: 20,
            children: [
              AppCustomButton(
                title: 'كشف حساب عميل',
                borderRadius: 8,
                onPressed: () {},
              ),
              AppCustomButton(
                title: 'الأقساط المجدولة',
                borderRadius: 8,
                color: Colors.white,
                titleColor: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
          const VerticalSpacing(40),
          const Text(
            'الفواتير / المعاملات',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(20),
          DynamicTable(
            rowData: List.generate(
              4,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'رقم الفاتورة': const TableCustomText('12345'),
                'تاريخ الطلب': const TableCustomText('21/07/2023'),
                'المسئول عن الطلبية': const TableCustomText('اسم المسؤول'),
                'عدد منتجات الطلبية': const TableCustomText('10'),
                'تاريخ التسلم': const TableCustomText('21/07/2023'),
                'إجمالي السعر': const TableCustomText('100'),
                'عدد الأقساط': const TableCustomText('3'),
                'وصف الطلبية': const TableCustomText('وصف الطلبية'),
                '': InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(AssetsManager.linkOut, height: 25),
                ),
              },
            ),
          ),
          const VerticalSpacing(20),
          AppCustomButton(
            title: 'إضافة طلبية جديدة',
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AddNewCustomerOrderDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}

