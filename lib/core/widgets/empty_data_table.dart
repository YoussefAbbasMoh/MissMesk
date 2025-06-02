import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/dynamic_table.dart';

class EmptyDataTable extends StatelessWidget {
  const EmptyDataTable({super.key, required this.columnNames});

  final List<String>? columnNames;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DynamicTable(columnNames: columnNames ?? [], rowData: const []),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'لم يتم العثور على نتائج',
            style: AppTextStyles.font18BlackRegular,
          ),
        ),
      ],
    );
  }
}
