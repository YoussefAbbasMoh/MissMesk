import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory/cubit/inventory_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventory/add_item_dialog.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventory/inventory_table_bloc_builder.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventory/inventory_filters_bloc_builder.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventory/products_filter.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductsFilter(
                filters: ['الكل', 'المواد الخام', 'المنتجات المكتملة'],
              ),
              SearchWithActions(),
            ],
          ),
          const VerticalSpacing(40),
          const InventoryFilterWidget(),
          const VerticalSpacing(40),
          const InventoryTableBlocBuilder(),
          const VerticalSpacing(20),
          BlocBuilder<InventoryCubit, InventoryState>(
            builder: (context, state) {
              if (context.read<InventoryCubit>().selectedInventory?.product ==
                  null) {
                return const SizedBox.shrink();
              }
              return AppCustomButton(
                title: 'اضافة صنف',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AddItemDialog(),
                  );
                },
                icon: Icons.add,
              );
            },
          ),
        ],
      ),
    );
  }
}
