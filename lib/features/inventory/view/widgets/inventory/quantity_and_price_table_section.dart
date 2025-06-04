import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/empty_data_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/data/models/product_details_model.dart';

class QuantityAndPriceTableSection extends StatelessWidget {
  const QuantityAndPriceTableSection({super.key, required this.productDetails});

  final ProductDetailsModel productDetails;

  @override
  Widget build(BuildContext context) {
    final availableQuantities = productDetails.availableQuantity ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'سجل الكميات والأسعار',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        const VerticalSpacing(10),
        if (availableQuantities.isNotEmpty)
          DynamicTable(
            rowData: List.generate(
              availableQuantities.length,
              (index) => {
                'الرقم التسلسلي': TableCustomText('${index + 1}'),
                'كود الكمية': TableCustomText(
                  availableQuantities[index].code ?? '',
                ),
                'المورد': TableCustomText(
                  availableQuantities[index].supplier ?? '',
                ),
                'الكمية': TableCustomText(
                  availableQuantities[index].quantity?.toString() ?? '',
                ),
                'تاريخ العملية': TableCustomText(
                  DateFormat('yyyy-MM-dd').format(
                    DateTime.tryParse(availableQuantities[index].date ?? '') ??
                        DateTime(0),
                  ),
                ),
                'الحالة': TableCustomText(
                  availableQuantities[index].state ?? '',
                ),
                'سعر الوحدة': TableCustomText(
                  availableQuantities[index].unitPrice?.toString() ?? '',
                ),
                'قام بالتسجيل': TableCustomText(
                  availableQuantities[index].registeredBy ?? '',
                ),
              },
            ),
          )
        else
          const EmptyDataTable(
            columnNames: [
              'الرقم التسلسلي',
              'كود الكمية',
              'المورد',
              'الكمية',
              'تاريخ العملية',
              'الحالة',
              'سعر الوحدة',
              'قام بالتسجيل',
            ],
          ),
      ],
    );
  }
}
