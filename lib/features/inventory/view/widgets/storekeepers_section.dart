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
import 'package:miss_misq/features/inventory/data/models/store_keeper_model.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_storekeeper_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class StorekeepersSection extends StatefulWidget {
  const StorekeepersSection({super.key});

  @override
  State<StorekeepersSection> createState() => _StorekeepersSectionState();
}

class _StorekeepersSectionState extends State<StorekeepersSection> {
  @override
  void initState() {
    super.initState();
    context.read<InventoryAdjustmentsCubit>().getStoreKeepers();
  }

  final List storekeeperStates = List.unmodifiable([
    InventoryAdjustmentsGetStoreKeepersLoading,
    InventoryAdjustmentsGetStoreKeepersSuccess,
    InventoryAdjustmentsGetStoreKeepersFailure,
    AddStoreKeeperLoading,
    AddStoreKeeperSuccess,
    AddStoreKeeperFailure,
  ]);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryAdjustmentsCubit, InventoryAdjustmentsState>(
      listenWhen:
          (previous, current) =>
              storekeeperStates.skip(3).contains(current.runtimeType),
      buildWhen:
          (previous, current) =>
              storekeeperStates.take(3).contains(current.runtimeType),
      listener: (context, state) {
        if (state is AddStoreKeeperSuccess) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.success,
          );
          context.read<InventoryAdjustmentsCubit>().getStoreKeepers();
        } else if (state is AddStoreKeeperFailure) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.error,
          );
        } else if (state is AddStoreKeeperLoading) {
          showLoading(context);
        }
      },
      builder: (context, state) {
        final isLoading = state is InventoryAdjustmentsGetStoreKeepersLoading;
        final isError = state is InventoryAdjustmentsGetStoreKeepersFailure;
        final List<StorekeeperModel>? storekeepers = switch (state) {
          InventoryAdjustmentsGetStoreKeepersSuccess s => s.storekeepers,
          _ => null,
        };

        if (!isLoading && (storekeepers == null || storekeepers.isEmpty)) {
          return const EmptyDataTable(
            columnNames: [
              'الرقم التسلسلي',
              'اسم الأمين',
              'رقم الهاتف',
              'اسم المخزن',
              '',
            ],
          );
        }

        return Skeletonizer(
          enabled: isLoading,
          child: SizedBox(
            width: context.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'سجل أمناء المخازن',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                const VerticalSpacing(10),
                if (!isError) ...[
                  DynamicTable(
                    rowData: List.generate(
                      isLoading ? 3 : storekeepers!.length,
                      (index) => {
                        'الرقم التسلسلي':
                            isLoading
                                ? const TableCustomText('')
                                : TableCustomText('${index + 1}'),
                        'اسم الأمين':
                            isLoading
                                ? const TableCustomText('')
                                : TableCustomText(
                                  storekeepers![index].name ?? '',
                                ),
                        'رقم الهاتف':
                            isLoading
                                ? const TableCustomText('')
                                : TableCustomText(
                                  storekeepers![index].phoneNumber ?? '',
                                ),
                        'اسم المخزن':
                            isLoading
                                ? const TableCustomText('')
                                : TableCustomText(
                                  storekeepers![index].inventory?.name ?? '',
                                ),
                        '': InkWell(
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
                      title: 'إضافة أمين',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AddStorekeeperDialog(),
                        );
                      },
                      icon: Icons.add,
                    ),
                  ),
                ],
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
