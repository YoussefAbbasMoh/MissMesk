import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory/cubit/inventory_cubit.dart';

class ProductsFilter extends StatefulWidget {
  final List<String> filters;
  final void Function(String)? onFilterSelected;

  const ProductsFilter({
    super.key,
    required this.filters,
    this.onFilterSelected,
  });

  @override
  State<ProductsFilter> createState() => _ProductsFilterState();
}

class _ProductsFilterState extends State<ProductsFilter> {
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.filters.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          widget.filters.map((filter) {
            final isSelected = filter == selectedFilter;
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedFilter = filter;
                  });
                  if (widget.onFilterSelected != null) {
                    widget.onFilterSelected!(filter);
                  }
                  context.read<InventoryCubit>().selectProductType(
                    filter == 'المواد الخام'
                        ? 'raw'
                        : filter == 'المنتجات المكتملة'
                        ? 'finished'
                        : null,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(40, 73),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  backgroundColor:
                      isSelected
                          ? const Color(0XFFF9F5EE)
                          : const Color(0XFFFFFFFF),
                  side:
                      isSelected
                          ? const BorderSide(color: AppPallete.brownColor)
                          : BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  filter,
                  style: AppTextStyles.font18BlackRegular.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
