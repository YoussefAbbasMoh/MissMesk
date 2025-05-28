import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/settings/data/models/get_all_accounts_response_model.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';
import 'package:miss_misq/features/settings/view/widgets/add_user_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PermissionsTable extends StatefulWidget {
  const PermissionsTable({super.key});

  @override
  State<PermissionsTable> createState() => _PermissionsTableState();
}

class _PermissionsTableState extends State<PermissionsTable> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getAllAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الصلاحيات والأدوار',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        const VerticalSpacing(20),
        BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previous, current) {
            return current is SettingsGetAllAccountsSuccess ||
                current is SettingsGetAllAccountsFailure ||
                current is SettingsGetAllAccountsLoading;
          },
          builder: (context, state) {
            final isLoading = state is SettingsGetAllAccountsLoading;
            final hasData = state is SettingsGetAllAccountsSuccess;

            final accounts =
                hasData
                    ? state.accounts
                    : List.filled(
                      3,
                      UserAccount(name: 'اسم المستخدم', email: 'user@email'),
                    );

            if (state is SettingsGetAllAccountsFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
              );
            }

            return Skeletonizer(
              enabled: isLoading,
              child:
                  accounts.isEmpty
                      ? const Center(
                        child: Text(
                          'لا يوجد حسابات',
                          style: AppTextStyles.font16BlackSemiBold,
                        ),
                      )
                      : DynamicTable(
                        tableWidth: context.width * 0.6,
                        rowData: List.generate(
                          accounts.length,
                          (index) => {
                            'المستخدم': TableCustomText(
                              accounts[index].name ?? 'غير معروف',
                            ),
                            'البريد الإلكتروني': TableCustomText(
                              accounts[index].email ?? 'لا يوجد بريد إلكتروني',
                            ),
                            'الأقسام المفتوحة': TableCustomText(
                              UserAccount.getPermissions(accounts[index]),
                            ),
                            'الإجراءات': Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppPallete.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => const AddUserDialog(),
                                    );
                                  },
                                  icon: TableCustomIcon(
                                    AssetsManager.edit,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: const Color(0XFFAD0A0A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 14,
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: TableCustomIcon(
                                    AssetsManager.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          },
                        ),
                      ),
            );
          },
        ),
      ],
    );
  }
}
