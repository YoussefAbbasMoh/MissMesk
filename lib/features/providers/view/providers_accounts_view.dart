import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/providers/models/provider_model.dart';
import 'package:miss_misq/features/providers/view/widgets/add_new_order_dialog.dart';

class ProvidersAccountsView extends StatelessWidget {
  const ProvidersAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('حسابات الموردين', style: AppTextStyles.font16BlackSemiBold),
              Spacer(),
              SearchWithActions(),
            ],
          ),
          DynamicTable(
            rowData: List.generate(
              providers.length,
              (index) => {
                'الرقم التسلسلي': TableCustomText(
                  providers[index].serialNumber,
                ),
                'كود المورد': TableCustomText(providers[index].providerCode),
                'اسم المورد': TableCustomText(providers[index].providerName),
                'اسم ممثل التوريدات': TableCustomText(
                  providers[index].providerRepresenter,
                ),
                'رقم الهاتف': TableCustomText(
                  providers[index].providerPhoneNumber,
                ),
                'عنوان المورد': TableCustomText(
                  providers[index].providerAddress,
                ),
                'نشاط المورد': TableCustomText(
                  providers[index].providerActivity,
                ),
                'نوع التوريدات': TableCustomText(providers[index].providerType),
                'الوصف': TableCustomText(providers[index].description),
                '': InkWell(
                  onTap: () {
                    context.go(
                      '${AppRoutes.providerDetails}?providerName=${providers[index].providerName}&mainIndex=${context.queryParam('mainIndex')}&subIndex=${context.queryParam('subIndex')}',
                      extra: providers[index],
                    );
                  },
                  child: SvgPicture.asset(AssetsManager.linkOut, height: 25),
                ),
              },
            ),
          ),
          AppCustomButton(
            title: 'إضافة حساب',
            icon: Icons.add,
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
