import 'package:flutter/material.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/features/inventory/data/models/product_details_model.dart';

class InventoryDetailsFields extends StatelessWidget {
  const InventoryDetailsFields({super.key, required this.productDetails});

  final ProductDetailsModel productDetails;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: [
        AppCustomTextField(
          label: 'رقم المخزن',
          hintText: '123',
          width: 200,
          titleFontSize: 14,
          isRequired: false,
          fillColor: Colors.white,
          initialValue: productDetails.inventoryId?.number?.toString(),
        ),
        AppCustomTextField(
          label: 'اسم المخزن',
          hintText: '123',
          width: 200,
          titleFontSize: 14,
          isRequired: false,
          fillColor: Colors.white,
          initialValue: productDetails.inventoryId?.name,
        ),
        AppCustomTextField(
          label: 'مكان المخزن',
          hintText: '123',
          width: 200,
          titleFontSize: 14,
          isRequired: false,
          fillColor: Colors.white,
          initialValue: productDetails.inventoryId?.address,
        ),
        AppCustomTextField(
          label: 'رقم الرف',
          hintText: '123',
          width: 200,
          titleFontSize: 14,
          isRequired: false,
          fillColor: Colors.white,
          initialValue: productDetails.rowName,
        ),
        AppCustomTextField(
          label: 'الوحدة',
          hintText: '123',
          width: 200,
          titleFontSize: 14,
          isRequired: false,
          fillColor: Colors.white,
          initialValue: productDetails.productionContainer,
        ),
        AppCustomTextField(
          label: 'حد الطلب',
          hintText: '123',
          width: 200,
          titleFontSize: 14,
          isRequired: false,
          fillColor: Colors.white,
          initialValue: productDetails.minCount?.toString(),
        ),
        AppCustomTextField(
          label: 'نوع المنتج',
          hintText: '123',
          width: 200,
          titleFontSize: 14,
          isRequired: false,
          fillColor: Colors.white,
          initialValue: productDetails.productType,
        ),
      ],
    );
  }
}
