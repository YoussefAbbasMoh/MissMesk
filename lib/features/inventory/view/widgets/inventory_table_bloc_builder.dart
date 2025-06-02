import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/empty_data_table.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory/cubit/inventory_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InventoryTableBlocBuilder extends StatelessWidget {
  const InventoryTableBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      buildWhen:
          (previous, current) =>
              current is GetInventorySuccess ||
              current is GetInventoryFailure ||
              current is GetInventoryLoading,
      builder: (context, state) {
        if (state is GetInventoryFailure) {
          return Center(child: Text(state.message));
        } else if (state is GetInventoryLoading ||
            state is GetInventorySuccess) {
          final isLoading = state is GetInventoryLoading;
          final products =
              state is GetInventorySuccess ? state.inventory.product ?? [] : [];

          if (!isLoading && products.isEmpty) {
            return const EmptyDataTable(
              columnNames: [
                'الرقم التسلسلي',
                'كود الصنف',
                'اسم الصنف',
                'الوحدة',
                'الكمية الدفترية',
              ],
            );
          }

          return Skeletonizer(
            enabled: isLoading,
            child: DynamicTable(
              rowData: List.generate(
                isLoading ? 4 : products.length,
                (index) => {
                  'الرقم التسلسلي':
                      isLoading
                          ? const TableCustomText('')
                          : TableCustomText('${index + 1}'),
                  'كود الصنف':
                      isLoading
                          ? const TableCustomText('')
                          : TableCustomText(products[index].code ?? '-'),
                  'اسم الصنف':
                      isLoading
                          ? const TableCustomText('')
                          : TableCustomText(products[index].name ?? '-'),
                  'الوحدة':
                      isLoading
                          ? const TableCustomText('')
                          : TableCustomText(
                            products[index].productContainer ?? '-',
                          ),
                  'الكمية الدفترية':
                      isLoading
                          ? const TableCustomText('')
                          : TableCustomText(
                            products[index].quantity.toString(),
                          ),
                  '': InkWell(
                    onTap: () {
                      if (!isLoading) {
                        context.go(
                          '${AppRoutes.itemCardBase}?itemId=بطاقة مخزون صنف 89235&mainIndex=${context.queryParam('mainIndex')}&subIndex=${context.queryParam('subIndex')}',
                        );
                      }
                    },
                    child:
                        isLoading
                            ? Skeleton.shade(
                              child: TableCustomIcon(AssetsManager.linkOut),
                            )
                            : TableCustomIcon(AssetsManager.linkOut),
                  ),
                },
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Text(
                'الرجاء اختيار اسم المخزن',
                style: AppTextStyles.font21WhiteRegular.copyWith(
                  color: AppPallete.greyColor,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
