import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/clients/view/widgets/search_result_item.dart';
import 'package:miss_misq/features/providers/view/widgets/add_new_item_dialog.dart';

class InvoiceSearchSection extends StatefulWidget {
  const InvoiceSearchSection({super.key});

  @override
  State<InvoiceSearchSection> createState() => _InvoiceSearchSectionState();
}

class _InvoiceSearchSectionState extends State<InvoiceSearchSection> {
  bool isSearching = false;

  List<String> listOfItems = [
    'قماش كتان عالي الجودة',
    'قماش كتان',
    'قماش عادي',
  ];

  List<String> searchedItems = [];

  void search(String value) {
    setState(() {
      searchedItems =
          listOfItems
              .where(
                (element) =>
                    element.toLowerCase().contains(value.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomTextField(
          onChanged: (value) {
            search(value);
            setState(() {
              isSearching = value.isNotEmpty;
            });
          },
          label: 'المنتجات المطلوبة',
          hintText: 'بحث بإسم او كود الصنف',
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
                          'لا يوجد صنف بهذا الأسم أو الكود',
                          style: AppTextStyles.font14GreyRegular.copyWith(
                            color: AppPallete.lightGreyColor,
                          ),
                        ),
                        const VerticalSpacing(5),
                        AppCustomButton(
                          title: 'إنشاء صنف جديد',
                          color: AppPallete.primaryColor,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const AddNewItemDialog(),
                            );
                          },
                        ),
                        const VerticalSpacing(10),
                      ]
                      : List.generate(
                        searchedItems.length,
                        (index) => SearchResultItem(
                          title: searchedItems[index],
                          onTap: () {},
                        ),
                      ),
            ),
          ),
      ],
    );
  }
}
