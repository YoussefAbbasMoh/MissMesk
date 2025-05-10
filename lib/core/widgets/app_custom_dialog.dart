import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class AppCustomDialog extends StatelessWidget {
  const AppCustomDialog({
    super.key,
    required this.child,
    required this.title,
    required this.iconPath,
    this.onSave,
  });

  final Widget child;
  final String title;
  final String iconPath;
  final void Function()? onSave;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DialogHeader(title: title, iconPath: iconPath, onSave: onSave),
                Padding(padding: const EdgeInsets.all(24), child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DialogHeader extends StatelessWidget {
  const _DialogHeader({
    required this.title,
    required this.iconPath,
    this.onSave,
  });

  final String title;
  final String iconPath;
  final void Function()? onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppPallete.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 25,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const HorizontalSpaing(10),
          Text(title, style: AppTextStyles.font18WhiteSemiBold),
          const Spacer(),
          _ActionButtonGroup(
            icon: Icons.save_outlined,
            text: 'حفظ',
            iconColor: Colors.white,
            bgColor: AppPallete.greenColoor,
            onPressed: onSave,
          ),
          const HorizontalSpaing(10),
          _ActionButtonGroup(
            icon: Icons.cancel,
            text: 'إلغاء',
            iconColor: Colors.white,
            bgColor: AppPallete.darkRedColor,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _ActionButtonGroup extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback? onPressed;

  const _ActionButtonGroup({
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.bgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Text(text, style: AppTextStyles.font14BlackRegular),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
              color: bgColor,
            ),
            padding: const EdgeInsets.all(13),
            child: Icon(icon, color: iconColor, size: 15),
          ),
        ],
      ),
    );
  }
}
