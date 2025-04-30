import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class Breadcrumbs extends StatelessWidget {
  const Breadcrumbs({super.key});

  @override
  Widget build(BuildContext context) {
    final uriSegments = GoRouterState.of(context).uri.toString().split('/');

    final validSegments = uriSegments.where((e) => e.isNotEmpty).toList();

    List<Widget> breadcrumbWidgets = [];
    String accumulatedPath = '';

    for (int i = 0; i < validSegments.length; i++) {
      accumulatedPath += '/${validSegments[i]}';

      if (arabicBreadcrumbTitles.containsKey(accumulatedPath)) {
        breadcrumbWidgets.add(
          InkWell(
            onTap: () => context.go(accumulatedPath),
            child: Text(
              arabicBreadcrumbTitles[accumulatedPath]!,
              style: AppTextStyles.font16BlackRegular.copyWith(
                color:
                    i == validSegments.length - 1 ? Colors.black : Colors.blue,
              ),
            ),
          ),
        );

        if (i < validSegments.length - 1) {
          breadcrumbWidgets.add(const Text(' > '));
        }
      }

      if (i < validSegments.length - 1) {
        breadcrumbWidgets.add(const Text(' > '));
      }
    }

    return Row(children: breadcrumbWidgets);
  }
}
