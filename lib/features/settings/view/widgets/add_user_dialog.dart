import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/di/dependency_injcection.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/check_box_with_title.dart';
import 'package:miss_misq/features/settings/data/models/get_all_accounts_response_model.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';
import 'package:toastification/toastification.dart';

class AddUserDialog extends StatefulWidget {
  const AddUserDialog({super.key, this.isUpdate = false, this.user});
  final bool isUpdate;
  final UserAccount? user;

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  Map<String, bool> permissions = {
    'all': false,
    'assets': false,
    'inventory': false,
    'production': false,
    'clients': false,
    'suppliers': false,
    'daily': false,
    'settings': false,
  };

  final Map<String, String> titleToKey = {
    'الكل': 'all',
    'إدارة الأصول': 'assets',
    'إدارة المخزون': 'inventory',
    'إدارة متابعة الإنتاج': 'production',
    'إدارة سجل العملاء': 'clients',
    'إدارة سجل الموردين': 'suppliers',
    'دفتر اليومية': 'daily',
    'الإعدادات': 'settings',
  };

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    if (widget.isUpdate) {
      nameController.text = widget.user!.name ?? '';
      emailController.text = widget.user!.email ?? '';
      passwordController.text = widget.user!.password ?? '';
      confirmPasswordController.text = widget.user!.confirmPassword ?? '';
      permissions = {
        'all': widget.user!.assets ?? false,
        'assets': widget.user!.assets ?? false,
        'inventory': widget.user!.inventory ?? false,
        'production': widget.user!.production ?? false,
        'clients': widget.user!.clients ?? false,
        'suppliers': widget.user!.suppliers ?? false,
        'daily': widget.user!.daily ?? false,
        'settings': widget.user!.settings ?? false,
      };
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<SettingsCubit>(),
      child: Builder(
        builder: (context) {
          return Form(
            key: formKey,
            child: AppCustomDialog(
              title: widget.isUpdate ? 'تحديث المستخدم' : 'إضافة مستخدم',
              onSave: () {
                if (formKey.currentState!.validate()) {
                  if (!permissions.containsValue(true)) {
                    showToastification(
                      message: 'يرجى تحديد صلاحيات المستخدم',
                      type: ToastificationType.error,
                    );
                    return;
                  }
                  widget.isUpdate
                      ? context.read<SettingsCubit>().updateAccount(
                        user: UserAccount(
                          id: widget.user!.id,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          assets: permissions['assets'] ?? false,
                          inventory: permissions['inventory'] ?? false,
                          production: permissions['production'] ?? false,
                          clients: permissions['clients'] ?? false,
                          suppliers: permissions['suppliers'] ?? false,
                          daily: permissions['daily'] ?? false,
                          settings: permissions['settings'] ?? false,
                        ),
                      )
                      : context.read<SettingsCubit>().addAccount(
                        user: UserAccount(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          assets: permissions['assets'] ?? false,
                          inventory: permissions['inventory'] ?? false,
                          production: permissions['production'] ?? false,
                          clients: permissions['clients'] ?? false,
                          suppliers: permissions['suppliers'] ?? false,
                          daily: permissions['daily'] ?? false,
                          settings: permissions['settings'] ?? false,
                        ),
                      );
                  context.pop();
                }
              },
              children: [
                const Text(
                  'بيانات المستخدم',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                Row(
                  spacing: 20,
                  children: [
                    Flexible(
                      child: AppCustomTextField(
                        isReadOnly: widget.isUpdate,
                        isRequired: !widget.isUpdate,
                        titleFontSize: 14,
                        label: 'الإسم',
                        hintText: 'أضف أسم المستخدم',
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل الاسم';
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: AppCustomTextField(
                        isRequired: !widget.isUpdate,
                        isReadOnly: widget.isUpdate,
                        label: 'البريد الإلكتروني',
                        titleFontSize: 14,
                        hintText: 'أضف البريد الإلكتروني',
                        controller: emailController,
                        validator:
                            (value) =>
                                value!.isEmail() ? null : 'ادخل بريد صحيح',
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Flexible(
                      child: AppCustomTextField(
                        label: 'الباسورد',
                        titleFontSize: 14,
                        hintText: 'أضف الباسورد',
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (widget.isUpdate) return null;

                          if (value!.length < 8) {
                            return 'الباسورد يجب ان يكون على الاقل 8 حروف';
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: AppCustomTextField(
                        label: 'تأكيد الباسورد',
                        titleFontSize: 14,
                        hintText: 'أكد الباسورد',
                        obscureText: true,
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (widget.isUpdate) return null;
                          if (value == null || value.isEmpty) {
                            return 'ادخل تاكيد الباسورد';
                          }

                          if (value != passwordController.text) {
                            return 'الباسورد غير متطابق';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const Text(
                  'الصلاحيات',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                SizedBox(
                  width: context.width * 0.6,
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: [
                      for (var entry in titleToKey.entries)
                        SizedBox(
                          width: 170,
                          child: CheckBoxWithTitle(
                            title: entry.key,
                            value: permissions[entry.value] ?? false,
                            onChanged: (value) {
                              final key = entry.value;

                              if (key == 'all') {
                                permissions.updateAll((k, _) => value!);
                              } else {
                                permissions[key] = value!;

                                if (!value) {
                                  permissions['all'] = false;
                                } else {
                                  final allChecked = permissions.entries
                                      .where((e) => e.key != 'all')
                                      .every((e) => e.value == true);
                                  permissions['all'] = allChecked;
                                }
                              }
                              setState(() {
                                permissions = {...permissions};
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
