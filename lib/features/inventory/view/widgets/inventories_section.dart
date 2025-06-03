import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/show_loading.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/empty_data_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/data/models/inventory_model.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_new_inventory_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class InventoriesSection extends StatefulWidget {
  const InventoriesSection({super.key});

  @override
  State<InventoriesSection> createState() => _InventoriesSectionState();
}

class _InventoriesSectionState extends State<InventoriesSection> {
  @override
  void initState() {
    super.initState();
    context.read<InventoryAdjustmentsCubit>().getAllInventories();
  }

  final List inventoriesStates = List.unmodifiable([
    InventoryAdjustmentsGetAllInventoriesLoading,
    InventoryAdjustmentsGetAllInventoriesSuccess,
    InventoryAdjustmentsGetAllInventoriesFailure,
    AddInventorySuccess,
    AddInventoryFailure,
    AddInventoryLoading,
  ]);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryAdjustmentsCubit, InventoryAdjustmentsState>(
      buildWhen:
          (previous, current) =>
              inventoriesStates.take(3).contains(current.runtimeType),
      listenWhen:
          (previous, current) =>
              inventoriesStates.skip(3).contains(current.runtimeType),
      listener: (context, state) {
        if (state is AddInventorySuccess) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.success,
          );
          context.read<InventoryAdjustmentsCubit>().getAllInventories();
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
      builder: (context, state) {
        final bool isLoading =
            state is InventoryAdjustmentsGetAllInventoriesLoading;

        final List<InventoryModel> inventories =
            state is InventoryAdjustmentsGetAllInventoriesSuccess
                ? state.inventories
                : [];

        if (state is InventoryAdjustmentsGetAllInventoriesFailure) {
          return Center(child: Text(state.message));
        }

        if (!isLoading && (inventories.isEmpty)) {
          return const EmptyDataTable(
            columnNames: [
              'الرقم التسلسلي',
              'رقم المخزن',
              'اسم المخزن',
              'مكان المخزن',
              'الرفوف',
              '',
              ' ',
            ],
          );
        }
        return Skeletonizer(
          enabled: isLoading,
          child: Column(
            children: [
              DynamicTable(
                rowData: List.generate(
                  isLoading ? 3 : inventories.length,
                  (index) => {
                    'الرقم التسلسلي':
                        isLoading
                            ? const TableCustomText('')
                            : const TableCustomText('1'),
                    'رقم المخزن':
                        isLoading
                            ? const TableCustomText('')
                            : TableCustomText(
                              inventories[index].number.toString(),
                            ),
                    'اسم المخزن':
                        isLoading
                            ? const TableCustomText('')
                            : TableCustomText(inventories[index].name!),
                    'مكان المخزن':
                        isLoading
                            ? const TableCustomText('')
                            : TableCustomText(inventories[index].address!),
                    'الرفوف':
                        isLoading
                            ? const TableCustomText('')
                            : TableCustomText(
                              inventories[index].rowsName!.length.toString(),
                            ),
                    '': InkWell(
                      child: Skeleton.shade(
                        child: TableCustomIcon(AssetsManager.edit),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AddNewInventoryDialog(),
                        );
                      },
                    ),
                    ' ': InkWell(
                      child: Skeleton.shade(
                        child: TableCustomIcon(AssetsManager.delete),
                      ),
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
      },
    );
  }
}
