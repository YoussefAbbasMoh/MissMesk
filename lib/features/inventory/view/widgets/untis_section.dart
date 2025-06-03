import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/utils/show_loading.dart';
import 'package:miss_misq/core/utils/show_toastification.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/core/widgets/table_custom_text.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';
import 'package:miss_misq/features/inventory/view/widgets/add_unit_dialog.dart';
import 'package:toastification/toastification.dart';

class AddUnitSection extends StatelessWidget {
  const AddUnitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryAdjustmentsCubit, InventoryAdjustmentsState>(
      listenWhen:
          (previous, current) =>
              current is AddUnitSuccess ||
              current is AddUnitFailure ||
              current is AddUnitLoading,
      listener: (context, state) {
        if (state is AddUnitSuccess) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.success,
          );
        } else if (state is AddUnitFailure) {
          context.pop();
          showToastification(
            message: state.message,
            type: ToastificationType.error,
          );
        } else if (state is AddUnitLoading) {
          showLoading(context);
        }
      },
      child: SizedBox(
        width: context.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'وحدات الأصناف',
              style: AppTextStyles.font16BlackSemiBold,
            ),
            const VerticalSpacing(10),
            DynamicTable(
              rowData: List.generate(
                4,
                (index) => {
                  'الرقم التسلسلي': const TableCustomText('1'),
                  'الوحدة': const TableCustomText('الوحدة'),
                  '': InkWell(
                    child: TableCustomIcon(AssetsManager.delete),
                    onTap: () {},
                  ),
                },
              ),
            ),
            const VerticalSpacing(10),
            Align(
              alignment: Alignment.centerLeft,
              child: AppCustomButton(
                title: 'إضافة وحدة',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AddUnitDialog(),
                  );
                },
                icon: Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
