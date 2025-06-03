import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/show_loading.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_new_inventory_dialog.dart';
import 'package:toastification/toastification.dart';

class InventoriesSection extends StatelessWidget {
  const InventoriesSection({super.key});

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
      child: Column(
        children: [
          DynamicTable(
            rowData: List.generate(
              4,
              (index) => {
                'الرقم التسلسلي': const TableCustomText('1'),
                'رقم المخزن': const TableCustomText('12345'),
                'اسم المخزن': const TableCustomText('اسم المخزن'),
                'مكان المخزن': const TableCustomText(
                  'سوق العبور و امام كارفور، المنطقة الصناعية أ، قسم السلام شارع 40',
                ),
                'الرفوف': const TableCustomText('100'),
                '': InkWell(
                  child: TableCustomIcon(AssetsManager.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AddNewInventoryDialog(),
                    );
                  },
                ),
                ' ': InkWell(
                  child: TableCustomIcon(AssetsManager.delete),
                  onTap: () {},
                ),
              },
            ),
          ),
          const VerticalSpacing(10),
          Align(
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
        ],
      ),
    );
  }
}
