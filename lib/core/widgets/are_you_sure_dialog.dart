import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class AreYouSureDialog<T> extends StatelessWidget {
  const AreYouSureDialog({
    super.key,
    required this.title,
    this.onConfirm,
    required this.cubit,
  });

  final String title;
  final StateStreamableSource<Object?> cubit;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Builder(
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: context.width * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.font16BlackSemiBold,
                        textAlign: TextAlign.center,
                      ),
                      const VerticalSpacing(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 20,
                        children: [
                          Expanded(
                            child: AppCustomButton(
                              title: 'نعم',
                              color: AppPallete.darkRedColor,
                              borderRadius: 10,
                              onPressed: onConfirm,
                            ),
                          ),
                          Expanded(
                            child: AppCustomButton(
                              title: 'إلغاء',
                              color: AppPallete.primaryColor,
                              borderRadius: 10,
                              onPressed: () => context.pop(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
