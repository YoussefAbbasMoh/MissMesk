import 'package:flutter/material.dart';
import 'package:miss_misq/core/widgets/custom_app_bar.dart';
import 'package:miss_misq/core/widgets/side_menu.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const SideMenu(), Expanded(child: child)],
          ),
        ),
      ),
    );
  }
}
