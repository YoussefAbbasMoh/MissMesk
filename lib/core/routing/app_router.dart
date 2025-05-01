import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/widgets/main_layout.dart';
import 'package:miss_misq/features/home/view/home_view.dart';
import 'package:miss_misq/features/inventory/view/inventory_adjustments_view.dart';
import 'package:miss_misq/features/inventory/view/inventory_records_view.dart';
import 'package:miss_misq/features/inventory/view/inventory_view.dart';
import 'package:miss_misq/features/inventory/view/reports_view.dart';
import 'package:miss_misq/features/login/view/login_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    errorBuilder:
        (context, state) => const Scaffold(body: Center(child: Text('404'))),
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(child: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.inventory,
                builder: (context, state) => const InventoryView(),
              ),
              GoRoute(
                path: AppRoutes.inventoryRecords,
                builder: (context, state) => const InventoryRecordsView(),
              ),
              GoRoute(
                path: AppRoutes.reports,
                builder: (context, state) => const ReportsView(),
              ),
              GoRoute(
                path: AppRoutes.inventoryAdjustments,
                builder: (context, state) => const InventoryAdjustmentsView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
