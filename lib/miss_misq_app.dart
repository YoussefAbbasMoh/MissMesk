import 'package:flutter/material.dart';
import 'package:miss_misq/core/routing/app_router.dart';

class MissMisqApp extends StatelessWidget {
  const MissMisqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
