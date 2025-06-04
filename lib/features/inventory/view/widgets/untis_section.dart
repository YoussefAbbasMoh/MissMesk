import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/utils/show_loading.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/empty_data_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/data/models/item_unit_model.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_unit_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class AddUnitSection extends StatefulWidget {
  const AddUnitSection({super.key});

  @override
  State<AddUnitSection> createState() => _AddUnitSectionState();
}

class _AddUnitSectionState extends State<AddUnitSection> {
  @override
  void initState() {
    context.read<InventoryAdjustmentsCubit>().getAllUnits();
    super.initState();
  }

  final List unitsStates = List.unmodifiable([
    InventoryAdjustmentsGetAllUnitsLoading,
    InventoryAdjustmentsGetAllUnitsSuccess,
    InventoryAdjustmentsGetAllUnitsFailure,
    AddUnitLoading,
    AddUnitSuccess,
    AddUnitFailure,
  ]);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryAdjustmentsCubit, InventoryAdjustmentsState>(
      buildWhen:
          (previous, current) =>
              unitsStates.take(3).contains(current.runtimeType),
      listenWhen:
          (previous, current) =>
              unitsStates.skip(3).contains(current.runtimeType),
      listener: (context, state) {
        if (state is AddUnitSuccess) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.success,
          );
        } else if (state is AddUnitFailure) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.error,
          );
        } else if (state is AddUnitLoading) {
          showLoading(context);
        }
      },
      builder: (BuildContext context, InventoryAdjustmentsState state) {
        final isLoading = state is InventoryAdjustmentsGetAllUnitsLoading;
        final isError = state is InventoryAdjustmentsGetAllUnitsFailure;
        final List<ItemUnitModel>? units = switch (state) {
          InventoryAdjustmentsGetAllUnitsSuccess s => s.units,
          _ => null,
        };

        if (!isLoading && (units == null || units.isEmpty)) {
          return const EmptyDataTable(
            columnNames: ['الرقم التسلسلي', 'الوحدة', ''],
          );
        }
        return Skeletonizer(
          enabled: isLoading,
          child: SizedBox(
            width: context.width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'وحدات الأصناف',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                const VerticalSpacing(10),
                DynamicTable(
                  rowData: List.generate(
                    isLoading ? 4 : units!.length,
                    (index) => {
                      'الرقم التسلسلي':
                          isLoading
                              ? const TableCustomText('')
                              : TableCustomText('${index + 1}'),
                      'الوحدة':
                          isLoading
                              ? const TableCustomText('')
                              : TableCustomText('${units![index].name}'),
                      '': InkWell(
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
                    title: 'إضافة وحدة',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddUnitDialog(),
                      );
                    },
                    icon: Icons.add,
                  ),
                ),
                if (isError) ...[
                  Text(
                    (state).message,
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
