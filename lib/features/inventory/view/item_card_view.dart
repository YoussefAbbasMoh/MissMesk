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
import 'package:miss_misq/features/inventory/view/widgets/item_card_custom_text_feild.dart';

class ItemCardView extends StatelessWidget {
  const ItemCardView({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context) {
    final row = const DataRow(
      cells: [
        DataCell(Center(child: Text('1'))),
        DataCell(Center(child: Text('12345'))),
        DataCell(Center(child: Text('اسم المورد'))),
        DataCell(Center(child: Text('100'))),
        DataCell(Center(child: Text('21/07/2023'))),
        DataCell(Center(child: Text('بواقي'))),
        DataCell(Center(child: Text('100'))),
        DataCell(Center(child: Text('اسم المسجل'))),
      ],
    );
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
          DynamicTable(
            columnNames: const [
              'الرقم التسلسلي',
              'كود الكمية',
              'المورد',
              'الكمية',
              'تاريخ العملية',
              'الحالة',
              'سعر الوحدة',
              'قام بالتسجيل',
            ],
            rowData: [row, row, row, row, row, row, row, row],
          ),
          const VerticalSpacing(height: 30),
          Row(
            spacing: 30,
            children: [
              AppCustomButton(title: 'إضافة كمية', onPressed: () {}),
              AppCustomButton(
                title: 'صرف كمية',
                onPressed: () {},
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
