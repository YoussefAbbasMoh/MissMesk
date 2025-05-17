import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/search_result_item.dart';

class SearchWithResult extends StatefulWidget {
  final List<String> items;

  final String title;

  final String hintText;

  final String emptyResultsMessage;

  final String createNewLabel;

  final void Function(String)? onItemSelected;

  final VoidCallback? onAddNewItem;

  const SearchWithResult({
    super.key,
    required this.items,
    required this.title,
    required this.hintText,
    this.emptyResultsMessage = 'لا يوجد نتائج مطابقة',
    this.createNewLabel = 'إنشاء عنصر جديد',
    this.onItemSelected,
    this.onAddNewItem,
  });

  @override
  State<SearchWithResult> createState() => _SearchSelectFieldState();
}

class _SearchSelectFieldState extends State<SearchWithResult> {
  bool isSearching = false;
  List<String> searchedItems = [];

  void _search(String value) {
    setState(() {
      searchedItems =
          widget.items
              .where((e) => e.toLowerCase().contains(value.toLowerCase()))
              .toList();
      isSearching = value.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomTextField(
          onChanged: _search,
          label: widget.title,
          hintText: widget.hintText,
          width: context.width * .4,
          fillColor: Colors.white,
          isRequired: false,
          titleFontSize: 14,
          prefixIcon: const Icon(
            Icons.search,
            color: AppPallete.lightGreyColor,
          ),
          suffixIcon: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppPallete.primaryColor,
              padding: const EdgeInsets.all(16),
              shape: const RoundedRectangleBorder(),
            ),
            onPressed: () {},
            child: const Text('+', style: AppTextStyles.font24WhiteSemiBold),
          ),
        ),
        const VerticalSpacing(10),
        if (isSearching)
          Container(
            padding: const EdgeInsets.all(8),
            width: context.width * .4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              spacing: 10,
              children:
                  searchedItems.isEmpty
                      ? [
                        const VerticalSpacing(10),
                        Text(
                          widget.emptyResultsMessage,
                          style: AppTextStyles.font14GreyRegular.copyWith(
                            color: AppPallete.lightGreyColor,
                          ),
                        ),
                        const VerticalSpacing(5),
                        AppCustomButton(
                          title: widget.createNewLabel,
                          color: AppPallete.primaryColor,
                          onPressed: widget.onAddNewItem ?? () {},
                        ),
                        const VerticalSpacing(10),
                      ]
                      : List.generate(
                        searchedItems.length,
                        (i) => SearchResultItem(
                          title: searchedItems[i],
                          onTap:
                              () =>
                                  widget.onItemSelected?.call(searchedItems[i]),
                        ),
                      ),
            ),
          ),
      ],
    );
  }
}
