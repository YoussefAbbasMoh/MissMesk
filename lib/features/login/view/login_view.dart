import 'package:flutter/material.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/features/login/view/widgets/credits_section.dart';
import 'package:miss_misq/features/login/view/widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [_LogoSection(), LoginForm(), CreditsSection()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManager.logo,
      width: 250,
      height: 200,
      fit: BoxFit.fill,
    );
  }
}
