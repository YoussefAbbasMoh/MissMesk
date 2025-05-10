import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/app_custom_button.dart';
import 'package:miss_misq/core/widgets/app_custom_text_field.dart';
import 'package:miss_misq/core/widgets/spacing.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppPallete.primaryColor),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'مرحبا بعودتك',
                  style: AppTextStyles.font29BlackSemiBold,
                ),
                const VerticalSpacing(10),
                const Text(
                  'مرحباً بك في الموقع الإداري لمصانع Miss Misk Home Wear للملابس الجاهزة',
                  style: AppTextStyles.font16BlackRegular,
                  textAlign: TextAlign.center,
                ),
                const VerticalSpacing(30),
                AppCustomTextField(
                  label: 'الإيميل',
                  hintText: 'أدخل الإيميل الخاص بك',
                  width: size.width * 0.45,
                ),
                const VerticalSpacing(20),
                AppCustomTextField(
                  label: 'الباسوورد',
                  hintText: 'أدخل الباسوورد الخاص بك',
                  obscureText: true,
                  width: size.width * 0.45,
                ),
                const VerticalSpacing(30),
                AppCustomButton(
                  title: 'تسجيل الدخول',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      GoRouter.of(context).go(AppRoutes.home);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            AssetsManager.rightEllipse,
            width: size.width * 0.2,
            height: size.height * 0.2,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            AssetsManager.leftEllipse,
            width: size.width * 0.12,
            height: size.height * 0.3,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
