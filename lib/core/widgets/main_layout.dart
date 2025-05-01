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
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const IntrinsicWidth(
              stepWidth: 1,
              child: Padding(padding: EdgeInsets.all(16.0), child: SideMenu()),
            ),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
