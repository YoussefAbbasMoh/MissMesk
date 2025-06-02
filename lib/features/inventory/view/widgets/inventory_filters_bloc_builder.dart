import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory/cubit/inventory_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/drop_down_filter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InventoryFilterWidget extends StatefulWidget {
  const InventoryFilterWidget({super.key});

  @override
  State<InventoryFilterWidget> createState() => _InventoryFilterWidgetState();
}

class _InventoryFilterWidgetState extends State<InventoryFilterWidget> {
  @override
  void initState() {
    super.initState();
    context.read<InventoryCubit>().getAllInventories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      buildWhen:
          (previous, current) =>
              current is GetAllInvintoriesSuccess ||
              current is GetAllInvintoriesLoading ||
              current is GetAllInvintoriesFailure,
      builder: (context, state) {
        if (state is GetAllInvintoriesSuccess) {
          final selectedInventory =
              context.read<InventoryCubit>().selectedInventory;

          final inventoryNames =
              state.inventories
                  .map((e) => e.name ?? '')
                  .where((name) => name.isNotEmpty)
                  .toList();

          final rowNames =
              selectedInventory?.rowsName
                  ?.where((row) => row.trim().isNotEmpty)
                  .toList() ??
              [];

          return Wrap(
            spacing: 40,
            runSpacing: 20,
            alignment: WrapAlignment.start,
            children: [
              DropDownFilter(
                title: 'اسم المخزن',
                items: inventoryNames,
                selected: selectedInventory?.name,
                onChanged: (selected) {
                  context.read<InventoryCubit>().selectInventoryByName(
                    selected!,
                  );
                },
              ),

              DropDownFilter(
                title: 'عنوان المخزن',
                items:
                    selectedInventory?.address != null
                        ? [selectedInventory!.address!]
                        : [],
                selected: selectedInventory?.address,
                onChanged: null,
              ),

              DropDownFilter(
                title: 'اسم الرف',
                items: rowNames,
                selected: context.read<InventoryCubit>().selectedRowName,
                onChanged: (selected) {
                  context.read<InventoryCubit>().selectRowName(selected);
                },
              ),

              DropDownFilter(
                title: 'اسم أمين المخزن',
                items:
                    selectedInventory?.storekeeper != null
                        ? selectedInventory!.storekeeper!
                            .map((e) => e.name ?? '')
                            .where((name) => name.isNotEmpty)
                            .toList()
                        : [],
                selected:
                    selectedInventory?.storekeeper?.isNotEmpty == true
                        ? selectedInventory!.storekeeper!.first.name
                        : null,
                onChanged: null,
              ),
            ],
          );
        } else if (state is GetAllInvintoriesFailure) {
          return Text(state.message);
        } else {
          return Wrap(
            spacing: 40,
            runSpacing: 20,
            alignment: WrapAlignment.start,
            children: List.generate(4, (index) {
              return const Skeletonizer(
                child: DropDownFilter(
                  title: 'تحميل...',
                  items: ['جاري تحميل البيانات'],
                ),
              );
            }),
          );
        }
      },
    );
  }
}
