import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/di/dependency_injcection.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/features/inventory/data/models/add_inventory_request_model.dart';
import 'package:miss_misq/features/inventory/data/models/inventory_model.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';

class AddNewInventoryDialog extends StatefulWidget {
  const AddNewInventoryDialog({
    super.key,
    this.isUpdating = false,
    this.inventory,
  });
  final bool isUpdating;
  final InventoryModel? inventory;

  @override
  State<AddNewInventoryDialog> createState() => _AddNewInventoryDialogState();
}

class _AddNewInventoryDialogState extends State<AddNewInventoryDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController shelfNameController;
  late final TextEditingController inventoryNameController;
  late final TextEditingController inventoryAddressController;

  List<String> shelfNames = [];

  void addShelfName() {
    if (shelfNameController.text.isNotEmpty) {
      shelfNames.add(shelfNameController.text);
      shelfNameController.clear();
      setState(() {});
    }
  }

  @override
  void initState() {
    shelfNameController = TextEditingController();
    inventoryNameController = TextEditingController();
    inventoryAddressController = TextEditingController();
    if (widget.isUpdating) {
      inventoryNameController.text = widget.inventory!.name ?? '';
      inventoryAddressController.text = widget.inventory!.address ?? '';
      shelfNames = widget.inventory!.rowsName ?? [];
    }
    super.initState();
  }

  @override
  void dispose() {
    shelfNameController.dispose();
    inventoryNameController.dispose();
    inventoryAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<InventoryAdjustmentsCubit>(),
      child: Builder(
        builder: (context) {
          return Form(
            key: _formKey,
            child: AppCustomDialog(
              onSave: () {
                if (_formKey.currentState!.validate()) {
                  context.pop();
                  widget.isUpdating
                      ? context
                          .read<InventoryAdjustmentsCubit>()
                          .updateInventory(
                            inventory: AddInventoryRequestModel(
                              name: inventoryNameController.text,
                              address: inventoryAddressController.text,
                              rowsName: shelfNames,
                            ),
                            inventoryId: widget.inventory?.id ?? '',
                          )
                      : context.read<InventoryAdjustmentsCubit>().addInventory(
                        inventory: AddInventoryRequestModel(
                          name: inventoryNameController.text,
                          address: inventoryAddressController.text,
                          rowsName: shelfNames,
                        ),
                      );
                }
              },
              title: widget.isUpdating ? 'تعديل المخزن' : 'إضافة مخزن',
              children: [
                const Text(
                  'بيانات المخزن',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                Row(
                  spacing: 20,
                  children: [
                    Flexible(
                      child: AppCustomTextField(
                        label: 'اسم المخزن',
                        hintText: 'أضف اسم المخزن',
                        isRequired: false,
                        titleFontSize: 14,
                        controller: inventoryNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى ادخال اسم المخزن';
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: AppCustomTextField(
                        label: 'عنوان المخزن',
                        hintText: 'أضف عنوان المخزن',
                        isRequired: false,
                        titleFontSize: 14,
                        controller: inventoryAddressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى ادخال عنوان المخزن';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Flexible(child: SizedBox.shrink()),
                  ],
                ),
                const Text(
                  'بيانات الرفوف',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                AppCustomTextField(
                  label: 'أسماء الرفوف',
                  hintText: 'اكتب اسم او كود الرف',
                  isRequired: false,
                  width: context.width * 0.3,
                  controller: shelfNameController,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      onPressed: () {
                        addShelfName();
                      },
                      style: IconButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        backgroundColor: AppPallete.primaryColor,
                      ),
                      icon: const Icon(Icons.add, color: AppPallete.whiteColor),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  runAlignment: WrapAlignment.start,
                  children: List.generate(
                    shelfNames.length,
                    (index) => Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppPallete.lightGreyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(shelfNames[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
