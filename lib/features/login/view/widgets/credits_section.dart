import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsSection extends StatelessWidget {
  const CreditsSection({super.key});

  void _launchWebsite() async {
    final url = Uri.parse('https://www.absai.dev/');
    if (!await launchUrl(url, webOnlyWindowName: '_blank')) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: 'تم التصميم والتنفيذ من قِبَّلِ شركة ',
            style: AppTextStyles.font16BlackRegular,
            children: [
              TextSpan(
                text: 'ABS.AI',
                style: AppTextStyles.font16BlackRegular.copyWith(
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = _launchWebsite,
              ),
            ],
          ),
        ),
        Image.asset(AssetsManager.absLogo, width: 40, height: 40),
      ],
    );
  }
}
