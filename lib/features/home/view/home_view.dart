import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/main_layout.dart';
import 'package:miss_misq/core/widgets/spacing.dart';
import 'package:miss_misq/features/home/view/widgets/statistics_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: ListView(
        children: [
          const StatisticsWidget(),
          const VerticalSpacing(height: 20),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Ensure Column doesn't take all space
                  children: [
                    const Row(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'المخزون',
                          style: AppTextStyles.font18BlackRegular,
                        ),
                        Icon(Icons.arrow_forward_sharp),
                      ],
                    ),
                    const VerticalSpacing(height: 10),
                    SizedBox(
                      height: 400,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: DataTable2(
                          columnSpacing: 10,
                          headingRowColor: WidgetStateProperty.all<Color>(
                            AppPallete.primaryColor,
                          ),
                          dataRowColor: WidgetStateProperty.all<Color>(
                            AppPallete.whiteColor,
                          ),
                          border: const TableBorder.symmetric(
                            inside: BorderSide(
                              color: AppPallete.lightGreyColor,
                              width: 2,
                            ),
                          ),
                          columns: const [
                            DataColumn(
                              label: Text('كود الصنف'),
                              headingRowAlignment: MainAxisAlignment.center,
                            ),
                            DataColumn(
                              label: Text('أسم الصنف'),
                              headingRowAlignment: MainAxisAlignment.center,
                            ),
                            DataColumn(
                              label: Text('الوحدة'),
                              headingRowAlignment: MainAxisAlignment.center,
                            ),
                            DataColumn(
                              label: Text('الكمية الدفترية'),
                              headingRowAlignment: MainAxisAlignment.center,
                            ),
                          ],
                          rows: const [
                            DataRow(
                              cells: [
                                DataCell(Center(child: Text('1234'))),
                                DataCell(Center(child: Text('ملابس'))),
                                DataCell(Center(child: Text('قطعة'))),
                                DataCell(Center(child: Text('50'))),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Center(child: Text('1234'))),
                                DataCell(Center(child: Text('ملابس'))),
                                DataCell(Center(child: Text('قطعة'))),
                                DataCell(Center(child: Text('50'))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'أوامر الإنتاج',
                          style: AppTextStyles.font18BlackRegular,
                        ),
                        Icon(Icons.arrow_forward_sharp),
                      ],
                    ),
                    const VerticalSpacing(height: 10),
                    SizedBox(
                      height: 400,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: DataTable2(
                          columnSpacing: 10,
                          headingRowColor: WidgetStateProperty.all<Color>(
                            AppPallete.primaryColor,
                          ),
                          dataRowColor: WidgetStateProperty.all<Color>(
                            AppPallete.whiteColor,
                          ),
                          border: const TableBorder.symmetric(
                            inside: BorderSide(
                              color: AppPallete.lightGreyColor,
                              width: 2,
                            ),
                          ),
                          columns: const [
                            DataColumn(
                              label: Text('كود الصنف'),
                              headingRowAlignment: MainAxisAlignment.center,
                            ),
                            DataColumn(
                              label: Text('أسم الصنف'),
                              headingRowAlignment: MainAxisAlignment.center,
                            ),
                            DataColumn(
                              label: Text('الوحدة'),
                              headingRowAlignment: MainAxisAlignment.center,
                            ),
                            DataColumn(
                              label: Text('الكمية الدفترية'),
                              headingRowAlignment: MainAxisAlignment.center,
                            ),
                          ],
                          rows: const [
                            DataRow(
                              cells: [
                                DataCell(Center(child: Text('1234'))),
                                DataCell(Center(child: Text('ملابس'))),
                                DataCell(Center(child: Text('قطعة'))),
                                DataCell(Center(child: Text('50'))),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Center(child: Text('1234'))),
                                DataCell(Center(child: Text('ملابس'))),
                                DataCell(Center(child: Text('قطعة'))),
                                DataCell(Center(child: Text('50'))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
