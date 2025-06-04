import 'package:flutter/material.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: Loading()),
  );
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: AppPallete.lightBrownColor,
      valueColor: AlwaysStoppedAnimation<Color>(AppPallete.primaryColor),
    );
  }
}
