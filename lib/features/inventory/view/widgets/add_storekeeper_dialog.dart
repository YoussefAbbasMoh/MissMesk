import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/di/dependency_injcection.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/dropdown_text_field_with_title.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';
import 'package:toastification/toastification.dart';

class AddStorekeeperDialog extends StatefulWidget {
  const AddStorekeeperDialog({super.key});

  @override
  State<AddStorekeeperDialog> createState() => _AddStorekeeperDialogState();
}

class _AddStorekeeperDialogState extends State<AddStorekeeperDialog> {
  String? selectedInventoryName;
  String? selectedInventoryId;
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<InventoryAdjustmentsCubit>(),
      child: Builder(
        builder: (context) {
          return Form(
            key: formKey,
            child: AppCustomDialog(
              onSave: () {
                if (formKey.currentState!.validate()) {
                  if (selectedInventoryId == null) {
                    showToastification(
                      message: 'يرجى تحديد المخزن',
                      type: ToastificationType.error,
                    );
                    return;
                  }
                  context.pop();
                  context.read<InventoryAdjustmentsCubit>().addStoreKeeper(
                    inventoryId: selectedInventoryId!,
                    name: _nameController.text,
                    phoneNumber: _phoneController.text,
                  );
                }
              },
              title: 'إضافة أمين مخزن',
              children: [
                const Text(
                  'بيانات الأمين',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  spacing: 20,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: AppCustomTextField(
                        label: 'اسم الأمين',
                        titleFontSize: 14,
                        hintText: 'أضف اسم الأمين ',

                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل اسم الأمين';
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: DropdownTextFieldWithTitle(
                        title: 'المخزن',
                        hintText: 'حدد اسم المخزن',
                        onChanged: (value) {
                          selectedInventoryName = value;
                          selectedInventoryId =
                              context
                                  .read<InventoryAdjustmentsCubit>()
                                  .inventories
                                  .firstWhere(
                                    (element) => element.name == value,
                                  )
                                  .id;
                        },
                        items:
                            context
                                .read<InventoryAdjustmentsCubit>()
                                .inventories
                                .map((e) => e.name ?? '')
                                .where((name) => name.isNotEmpty)
                                .toList(),
                        value:
                            selectedInventoryName ??
                            context
                                .read<InventoryAdjustmentsCubit>()
                                .inventories
                                .first
                                .name ??
                            '',
                        isRequired: true,
                      ),
                    ),
                    Flexible(
                      child: AppCustomTextField(
                        label: 'رقم هاتف الأمين',
                        titleFontSize: 14,
                        hintText: 'ادخل رقم هاتف الأمين',
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل رقم هاتف الأمين';
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
