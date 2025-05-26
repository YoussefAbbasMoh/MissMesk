import 'package:flutter/material.dart';
import 'package:miss_misq/core/routing/app_router.dart';
import 'package:miss_misq/core/theming/app_pallete.dart';
import 'package:toastification/toastification.dart';

class MissMisqApp extends StatelessWidget {
  const MissMisqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          scaffoldBackgroundColor: AppPallete.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
