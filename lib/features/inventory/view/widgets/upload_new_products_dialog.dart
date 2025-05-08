import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/utils/extensions.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_dialog.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class UploadNewProductsDialog extends StatelessWidget {
  const UploadNewProductsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: 'رفع أصناف جديدة',
      iconPath: AssetsManager.management,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('حدد المخزن', style: AppTextStyles.font16BlackRegular),
          const VerticalSpacing(height: 10),
          Row(
            spacing: 10,
            children: [
              AppCustomButton(
                title: 'مخزن السلام',
                fontSize: 14,
                onPressed: () {},
                borderRadius: 8,
              ),
              const AppCustomButton(
                title: 'مخزن السلام',
                fontSize: 14,
                borderRadius: 8,
              ),
              const AppCustomButton(
                title: 'مخزن السلام',
                fontSize: 14,
                borderRadius: 8,
              ),
            ],
          ),
          const VerticalSpacing(height: 30),
          const Text('رفع الملف', style: AppTextStyles.font16BlackSemiBold),
          Divider(
            color: AppPallete.lightGreyColor.withAlpha(100),
            endIndent: context.width * 0.2,
            height: 20,
          ),
          SizedBox(
            width: context.width * 0.27,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              color: AppPallete.lightGreyColor.withAlpha(150),
              dashPattern: const [6, 6],
              strokeWidth: 2,
              child: Center(
                child: Column(
                  spacing: 20,
                  children: [
                    SvgPicture.asset(AssetsManager.uploadCloud, height: 30),
                    Text(
                      'انقر أو اسحب الملف إلى هذه المنطقة لتحميله',
                      style: AppTextStyles.font16BlackRegular.copyWith(
                        color: const Color(0XFF484848),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const VerticalSpacing(height: 10),
          Text(
            'أنواع الملفات المقبولة هي .csv و.xlsx',
            style: AppTextStyles.font14GreyRegular.copyWith(color: Colors.grey),
          ),
          Divider(
            color: AppPallete.lightGreyColor.withAlpha(100),
            endIndent: context.width * 0.25,
            height: 20,
          ),
          Row(
            spacing: 10,
            children: [
              AppCustomButton(
                title: 'حفظ',
                fontSize: 14,
                onPressed: () {},
                borderRadius: 8,
              ),
              AppCustomButton(
                title: 'إلغاء',
                onPressed: () {},
                borderColor: Colors.grey,
                color: Colors.white,
                titleColor: Colors.black,
                fontSize: 14,
                borderRadius: 8,
              ),
            ],
          ),
          const VerticalSpacing(height: 40),
          const Text(
            'تنبيه: إذا كان المخزن يحتوي على أصناف مسبقة فسيتم دمج الأصناف الجديدة مع الأصناف المخزنة سابقاً.',
            style: AppTextStyles.font14BlackRegular,
          ),
        ],
      ),
    );
  }
}
