import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/utils/show_loading.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_new_inventory_dialog.dart';
import 'package:toastification/toastification.dart';

class AddInventoryButtonAndBlocListener extends StatelessWidget {
  const AddInventoryButtonAndBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryAdjustmentsCubit, InventoryAdjustmentsState>(
      listenWhen:
          (previous, current) =>
              current is AddInventorySuccess ||
              current is AddInventoryFailure ||
              current is AddInventoryLoading,
      listener: (context, state) {
        if (state is AddInventorySuccess) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.success,
          );
        } else if (state is AddInventoryFailure) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.error,
          );
        } else if (state is AddInventoryLoading) {
          showLoading(context);
        }
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppCustomButton(
          title: 'إضافة مخزن',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const AddNewInventoryDialog(),
            );
          },
          icon: Icons.add,
        ),
      ),
    );
  }
}
