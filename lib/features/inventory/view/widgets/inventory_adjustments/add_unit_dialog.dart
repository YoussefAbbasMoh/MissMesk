import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/di/dependency_injcection.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';

class AddUnitDialog extends StatefulWidget {
  const AddUnitDialog({super.key});

  @override
  State<AddUnitDialog> createState() => _AddUnitDialogState();
}

class _AddUnitDialogState extends State<AddUnitDialog> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _unitController;

  @override
  void initState() {
    _unitController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _unitController.dispose();
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
                  context.pop();
                  context.read<InventoryAdjustmentsCubit>().addUnit(
                    unit: _unitController.text,
                  );
                }
              },
              title: 'إضافة وحدة قياس جديدة',
              children: [
                const Text(
                  'بيانات وحدة القياس',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                AppCustomTextField(
                  width: context.width * 0.15,
                  label: 'الوحدة',
                  controller: _unitController,
                  hintText: 'ضع وحدة القياس او التخزين',
                  isRequired: false,
                  titleFontSize: 14,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الوحدة';
                    }
                    return null;
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
