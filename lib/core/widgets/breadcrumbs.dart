import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/theming/app_text_styles.dart';

class Breadcrumbs extends StatelessWidget {
  const Breadcrumbs({super.key});

  @override
  Widget build(BuildContext context) {
    final uri = GoRouterState.of(context).uri;
    final uriSegments = uri.path.split('/');
    final validSegments = uriSegments.where((e) => e.isNotEmpty).toList();

    List<Widget> breadcrumbWidgets = [];
    String accumulatedPath = '';

    // 🧠 خريطة المسارات اللي بتستخدم query parameters بدل العنوان الثابت
    final Map<String, String> dynamicBreadcrumbRoutes = {
      AppRoutes.providerDetails: 'providerName',
      AppRoutes.itemCardBase: 'itemId',
    };

    for (int i = 0; i < validSegments.length; i++) {
      accumulatedPath += '/${validSegments[i]}';

      // 🔍 مطابقة المسار مع مفتاح موجود في العناوين
      String matchedKey = arabicBreadcrumbTitles.keys.firstWhere(
        (k) {
          if (k.contains('/:')) {
            final base = k.split('/:').first;
            return accumulatedPath.startsWith(base);
          }
          return accumulatedPath == k;
        },
        orElse: () => '',
      );

      if (matchedKey.isNotEmpty) {
        // 🧠 إذا المسار ضمن المسارات الديناميكية
        if (dynamicBreadcrumbRoutes.containsKey(matchedKey)) {
          final queryKey = dynamicBreadcrumbRoutes[matchedKey]!;
          final dynamicName = uri.queryParameters[queryKey] ?? 'تفاصيل';
          breadcrumbWidgets.add(
            Text(dynamicName, style: AppTextStyles.font16BlackRegular),
          );
        } else {
          breadcrumbWidgets.add(
            InkWell(
              onTap: () => context.go(accumulatedPath),
              child: Text(
                arabicBreadcrumbTitles[matchedKey]!,
                style: AppTextStyles.font16BlackRegular,
              ),
            ),
          );
        }

        if (i < validSegments.length - 1) {
          breadcrumbWidgets.add(const Text(' / '));
        }
      }
    }

    return Row(children: breadcrumbWidgets);
  }
}
