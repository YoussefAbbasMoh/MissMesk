import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/clients/view/widgets/create_client_account_dialog.dart';

class ClientsAccountsView extends StatelessWidget {
  const ClientsAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('حسابات العملاء', style: AppTextStyles.font16BlackSemiBold),
              Spacer(),
              SearchWithActions(),
            ],
          ),
          const VerticalSpacing(40),
          DynamicTable(
            rowData: List.generate(
              6,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'كود العميل': const TableCustomText('1234'),
                'اسم العميل': const TableCustomText('اسم العميل'),
                'رقم الهاتف': const TableCustomText('0123456789'),
                'اسم ممثل العميل': const TableCustomText('اسم ممثل العميل'),
                'عنوان العميل': const TableCustomText('عنوان العميل'),
                'نوع العميل': const TableCustomText('نوع العميل'),
                'الوصف': const TableCustomText('الوصف'),
                '': InkWell(
                  onTap: () {
                    context.go(
                      '${AppRoutes.clientDetails}?clientName=محل ملابس الأميرة',
                    );
                  },
                  child: SvgPicture.asset(AssetsManager.linkOut, height: 25),
                ),
              },
            ),
          ),
          const VerticalSpacing(20),
          AppCustomButton(
            title: 'إضافة حساب',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CreateClientAccountDialog(),
              );
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
