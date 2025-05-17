import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_result.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/clients/view/widgets/add_item_in_invoice_dialog.dart';
import 'package:miss_misq/features/providers/view/widgets/add_new_item_dialog.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

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
                    'بيانات الطلبية',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'رقم الفاتورة : 123456',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppPallete.primaryColor,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                icon: SvgPicture.asset(AssetsManager.download, width: 25),
              ),
            ],
          ),
          const VerticalSpacing(20),
          AppCustomTextField(
            width: context.width * .5,
            titleFontSize: 14,
            fillColor: Colors.white,
            minLines: 3,
            isRequired: false,
            label: 'وصف الطلبية',
            hintText: 'لا يوجد وصف',
          ),
          const VerticalSpacing(40),
          const Text(
            'بيانات الطلبية',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          SizedBox(
            width: context.width * .6,
            child: Row(
              spacing: 20,

              children: [
                Flexible(
                  child: _buildTextField('رقم الفاتورة', 'أدخل رقم الفاتورة'),
                ),
                Flexible(child: _buildTextField('تاريخ الطلب', '12052025')),
                Flexible(child: _buildTextField('تاريخ اللتسلم', '27052025')),
                Flexible(child: _buildTextField('عدد الأصناف', '8')),
              ],
            ),
          ),
          const VerticalSpacing(10),

          SizedBox(
            width: context.width * .6,
            child: Row(
              spacing: 20,
              children: [
                Flexible(
                  child: _buildTextField('المسئول عن الطلب', 'محمد حسونة'),
                ),
                Flexible(child: _buildTextField('نوع التوريدات', 'أقمشة')),
                Flexible(child: _buildTextField('إجمالي السعر', '937937')),
                Flexible(child: _buildTextField('طريقة الدفع', 'تحويل بنكي')),
              ],
            ),
          ),
          const VerticalSpacing(10),
          SizedBox(
            width: context.width * .14,
            child: _buildTextField('عدد الأقساط', '0'),
          ),
          const VerticalSpacing(20),
          SearchWithResult(
            items: const ['قطن ناعم', 'قماش عالي الجودة', 'قماش كتان'],
            title: 'إضافة صنف',
            hintText: 'بحث يأسم أو كود الصنف',
            onItemSelected: (value) {
              showDialog(
                context: context,
                builder: (context) => const AddItemInInvoiceDialog(),
              );
            },
            onAddNewItem: () {
              showDialog(
                context: context,
                builder: (context) => const AddNewItemDialog(),
              );
            },
          ),
          const VerticalSpacing(20),
          DynamicTable(
            rowData: List.generate(
              6,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'كود الصنف': const TableCustomText('123456'),
                'اسم الصنف': const TableCustomText('اسم الصنف'),
                'سعر الوحدة': const TableCustomText('100'),
                'الكمية': const TableCustomText('100'),
                'الوحدة': const TableCustomText('متر'),
                'إجمالي السعر': const TableCustomText('1000'),
                'الوصف': const TableCustomText('لا يوجد وصف'),
                '': InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(AssetsManager.linkOut, height: 25),
                ),
              },
            ),
          ),
          const VerticalSpacing(20),
          AppCustomButton(title: 'إضافة الطلبية', onPressed: () {}),
        ],
      ),
    );
  }

  AppCustomTextField _buildTextField(String title, String value) {
    return AppCustomTextField(
      label: title,
      hintText: value,
      fillColor: Colors.white,
      isRequired: false,
      titleFontSize: 14,
    );
  }
}
