import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/utils/show_loading.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/search_with_actions.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory/cubit/inventory_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_quantity_dialog.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventory/inventory_details_fields.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventory/quantity_and_price_table_section.dart';
import 'package:miss_misq/features/inventory/view/widgets/inventory/quantity_disbrusement_dialog.dart';

class ItemCardView extends StatefulWidget {
  const ItemCardView({super.key, required this.itemId});

  final String itemId;

  @override
  State<ItemCardView> createState() => _ItemCardViewState();
}

class _ItemCardViewState extends State<ItemCardView> {
  @override
  void initState() {
    super.initState();
    context.read<InventoryCubit>().getProductDetails(id: widget.itemId);
  }

  final List productDetailsStates = [
    InventoryGetProductDetailsLoading,
    InventoryGetProductDetailsSuccess,
    InventoryGetProductDetailsFailure,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      buildWhen:
          (previous, current) =>
              productDetailsStates.contains(current.runtimeType),
      builder: (context, state) {
        if (state is InventoryGetProductDetailsSuccess) {
          final productDetails = state.productDetails;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productDetails.name ?? '',
                          style: AppTextStyles.font16BlackSemiBold,
                        ),
                        Text(
                          'كود الصنف: ${productDetails.code ?? ''}',
                          style: AppTextStyles.font12GreyRegular,
                        ),
                        Text(
                          'تاريخ إنشاء المنتج: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(productDetails.createdAt ?? ''))}',
                          style: AppTextStyles.font12GreyRegular,
                        ),
                      ],
                    ),
                    const SearchWithActions(),
                  ],
                ),
                const VerticalSpacing(30),
                AppCustomTextField(
                  label: 'بيان الصنف',
                  hintText: 'لا يوجد وصف',
                  width: 800,
                  isRequired: false,
                  fillColor: Colors.white,
                  minLines: 3,
                  initialValue: productDetails.description ?? '',
                ),
                const VerticalSpacing(30),
                const Text(
                  'بيانات المخزن',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                const VerticalSpacing(10),
                InventoryDetailsFields(productDetails: productDetails),
                const VerticalSpacing(30),
                AppCustomButton(
                  title: 'سجل الحركات المخزنية',
                  onPressed: () {
                    context.go(
                      '${AppRoutes.inventoryTransactions}?itemId=${context.queryParam('itemId')}&mainIndex=${context.queryParam('mainIndex')}&subIndex=${context.queryParam('subIndex')}',
                    );
                  },
                ),
                const VerticalSpacing(30),
                QuantityAndPriceTableSection(productDetails: productDetails),
                const VerticalSpacing(20),
                Row(
                  spacing: 30,
                  children: [
                    AppCustomButton(
                      title: 'إضافة كمية',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const AddQuantityDialog(),
                        );
                      },
                    ),
                    AppCustomButton(
                      title: 'صرف كمية',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const QuantityDisbrusementDialog(),
                        );
                      },
                      color: AppPallete.whiteColor,
                      titleColor: AppPallete.blackColor,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is InventoryGetProductDetailsFailure) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Loading());
      },
    );
  }
}
