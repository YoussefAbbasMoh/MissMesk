import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/di/dependency_injcection.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';

class ResetPasswordDialog extends StatefulWidget {
  const ResetPasswordDialog({super.key});

  @override
  State<ResetPasswordDialog> createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              onSave: () {
                if (formKey.currentState!.validate()) {
                  context.pop();
                  context.read<SettingsCubit>().resetUserPassword(
                    newPassword: _passwordController.text,
                  );
                }
              },
              title: 'تغيير كلمة المرور',
              children: [
                const VerticalSpacing(20),
                Row(
                  spacing: 20,
                  children: [
                    Flexible(
                      child: AppCustomTextField(
                        titleFontSize: 14,
                        label: 'كلمة المرور الجديدة',
                        hintText: 'أدخل كلمة المرور',
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'كلمة المرور يجب ان تكون على الاقل 8 حروف';
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: AppCustomTextField(
                        titleFontSize: 14,
                        label: 'تاكيد كلمة المرور الجديدة',
                        hintText: 'أكد كلمة المرور',
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'كلمة المرور غير متطابقة';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
