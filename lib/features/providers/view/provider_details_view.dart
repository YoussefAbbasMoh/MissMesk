import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/providers/models/provider_model.dart';
import 'package:miss_misq/features/providers/view/widgets/create_provider_account_dialog.dart';

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
              AppCustomButton(
                title: 'كشف حساب المورد',
                onPressed: () {
                  context.go(
                    '${AppRoutes.providerAccountStatement}?providerName=${context.queryParam('providerName')}&mainIndex=${context.queryParam('mainIndex')}&subIndex=${context.queryParam('subIndex')}',
                  );
                },
              ),
              AppCustomButton(
                title: 'الأقساط المجدولة',
                onPressed: () {
                  context.go(
                    '${AppRoutes.providerScheduledInstallments}?providerName=${context.queryParam('providerName')}&mainIndex=${context.queryParam('mainIndex')}&subIndex=${context.queryParam('subIndex')}',
                  );
                },
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
                      '${AppRoutes.providerOrder}?providerName=${context.queryParam('providerName')}&orderId=طلبية_012872790&mainIndex=${context.queryParam('mainIndex')}&subIndex=${context.queryParam('subIndex')}',
                    );
                  },
                  child: TableCustomIcon(AssetsManager.linkOut),
                ),
              },
            ),
          ),
          AppCustomButton(
            title: 'إضافة طلبية جديدة',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CreateProviderAccountDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
