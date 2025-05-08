import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_quantity_dialog.dart';
import 'package:miss_misq/features/inventory/view/widgets/item_card_custom_text_feild.dart';
import 'package:miss_misq/features/inventory/view/widgets/quantity_disbrusement_dialog.dart';

class ItemCardView extends StatelessWidget {
  const ItemCardView({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context) {
    final row = {
      'الرقم التسلسلي': const TableCustomText('1'),
      'كود الكمية': const TableCustomText('12345'),
      'المورد': const TableCustomText('اسم المورد'),
      'الكمية': const TableCustomText('100'),
      'تاريخ العملية': const TableCustomText('21/07/2023'),
      'الحالة': const TableCustomText('بواقي'),
      'سعر الوحدة': const TableCustomText('100'),
      'قام بالتسجيل': const TableCustomText('اسم المسجل'),
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أتواب حرير مزركش ورد - أصفر كناري',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  Text(
                    'كود الصنف: 019910',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                  Text(
                    'تاريخ إنشاء المنتج: 21/07/2023',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const SearchWithActions(),
            ],
          ),
          const VerticalSpacing(height: 30),
          const AppCustomTextField(
            label: 'بيان الصنف',
            hintText: 'لا يوجد وصف',
            width: 800,
            isRequired: false,
            fillColor: Colors.white,
            minLines: 3,
          ),
          const VerticalSpacing(height: 30),
          const Text('بيانات المخزن', style: AppTextStyles.font16BlackSemiBold),
          const VerticalSpacing(height: 10),
          const Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.start,
            children: [
              ItemCardCustomTextFeild(label: 'رقم المخزن'),
              ItemCardCustomTextFeild(label: 'اسم المخزن'),
              ItemCardCustomTextFeild(label: 'مكان المخزن'),
              ItemCardCustomTextFeild(label: 'رقم الرف'),
              ItemCardCustomTextFeild(label: 'الوحدة'),
              ItemCardCustomTextFeild(label: 'حد الطلب'),
              ItemCardCustomTextFeild(label: 'نوع المنتج '),
            ],
          ),
          const VerticalSpacing(height: 30),
          AppCustomButton(
            title: 'سجل الحركات المخزنية',
            onPressed: () {
              context.go(AppRoutes.inventoryTransactions);
            },
          ),
          const VerticalSpacing(height: 30),
          const Text(
            'سجل الكميات والأسعار',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          const VerticalSpacing(height: 10),
          DynamicTable(rowData: [row, row, row, row, row, row, row, row, row]),
          const VerticalSpacing(height: 20),
          Row(
            spacing: 30,
            children: [
              AppCustomButton(
                title: 'إضافة كمية',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AddQuantityDialog(),
                  );
                },
              ),
              AppCustomButton(
                title: 'صرف كمية',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const QuantityDisbrusementDialog(),
                  );
                },
                color: AppPallete.whiteColor,
                titleColor: AppPallete.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
