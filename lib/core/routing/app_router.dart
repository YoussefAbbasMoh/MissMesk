import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miss_misq/core/di/dependency_injcection.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/widgets/main_layout.dart';
import 'package:miss_misq/features/clients/view/client_details_view.dart';
import 'package:miss_misq/features/clients/view/client_scheduled_installments_view.dart';
import 'package:miss_misq/features/clients/view/client_statement_view.dart';
import 'package:miss_misq/features/clients/view/clients_accounts_view.dart';
import 'package:miss_misq/features/clients/view/invoice_view.dart';

import 'package:miss_misq/features/home/view/home_view.dart';
import 'package:miss_misq/features/job_orders/view/job_order_details_view.dart';
import 'package:miss_misq/features/job_orders/view/job_orders_history_view.dart';
import 'package:miss_misq/features/login/view/cubit/login_cubit.dart';
import 'package:miss_misq/features/login/view/login_view.dart';

import 'package:miss_misq/features/inventory/view/inventory_view.dart';
import 'package:miss_misq/features/inventory/view/item_card_view.dart';
import 'package:miss_misq/features/inventory/view/inventory_records_view.dart';
import 'package:miss_misq/features/inventory/view/inventory_transactions_view.dart';
import 'package:miss_misq/features/inventory/view/reports_view.dart';
import 'package:miss_misq/features/inventory/view/inventory_adjustments_view.dart';
import 'package:miss_misq/features/inventory/view/new_inventory_process_view.dart';
import 'package:miss_misq/features/inventory/view/inventory_details_view.dart';

import 'package:miss_misq/features/assets/view/assets_groups_view.dart';
import 'package:miss_misq/features/assets/view/assets_history_view.dart';
import 'package:miss_misq/features/providers/models/provider_model.dart';
import 'package:miss_misq/features/providers/view/order_view.dart';
import 'package:miss_misq/features/providers/view/provider_account_statement_view.dart';

import 'package:miss_misq/features/providers/view/providers_accounts_view.dart';
import 'package:miss_misq/features/providers/view/provider_details_view.dart';
import 'package:miss_misq/features/providers/view/provider_scheduled_installments_view.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';

import 'package:miss_misq/features/settings/view/settings_view.dart';
import 'package:miss_misq/features/daily_log/view/daily_log_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    errorBuilder:
        (context, state) => const Scaffold(body: Center(child: Text('404'))),
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder:
            (context, state) =>
                BlocProvider.value(value: sl<LoginCubit>(), child: LoginView()),
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
              GoRoute(
                path: AppRoutes.inventoryTransactions,
                builder: (context, state) => const InventoryTransactionsView(),
              ),
              GoRoute(
                path: AppRoutes.itemCardBase,
                builder: (context, state) {
                  final id = state.pathParameters['itemId'] ?? '';
                  return ItemCardView(itemId: id);
                },
              ),
              GoRoute(
                path: AppRoutes.newInventoryProcess,
                builder: (context, state) => const NewInventoryProcessView(),
              ),
              GoRoute(
                path: AppRoutes.inventoryDetails,
                builder: (context, state) => const InventoryDetailsView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.assetsGroups,
                builder: (context, state) => const AssetsGroupsView(),
              ),
              GoRoute(
                path: AppRoutes.assetsHistory,
                builder: (context, state) => const AssetsHistoryView(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.providersAccounts,
                builder: (context, state) => const ProvidersAccountsView(),
              ),
              GoRoute(
                path: AppRoutes.providerDetails,
                builder: (context, state) {
                  final provider = state.extra as ProviderModel;
                  final providerName =
                      state.uri.queryParameters['providerName'] ?? '';
                  return ProviderDetailsView(
                    provider: provider,
                    providerName: providerName,
                  );
                },
              ),
              GoRoute(
                path: AppRoutes.providerAccountStatement,
                builder:
                    (context, state) => const ProviderAccountStatementView(),
              ),
              GoRoute(
                path: AppRoutes.providerScheduledInstallments,
                builder:
                    (context, state) =>
                        const ProviderScheduledInstallmentsView(),
              ),
              GoRoute(
                path: AppRoutes.providerOrder,
                builder: (context, state) {
                  return const OrderView();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.clientsAccounts,
                builder: (context, state) => const ClientsAccountsView(),
              ),
              GoRoute(
                path: AppRoutes.clientDetails,
                builder: (context, state) => const ClientDetailsView(),
              ),
              GoRoute(
                path: AppRoutes.clientStatement,
                builder: (context, state) => const ClientStatementView(),
              ),
              GoRoute(
                path: AppRoutes.clientScheduledInstallments,
                builder:
                    (context, state) => const ClientScheduledInstallmentsView(),
              ),
              GoRoute(
                path: AppRoutes.clientInvoice,
                builder: (context, state) => const InvoiceView(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.jobOrdersHistory,
                builder: (context, state) => const JobOrdersHistoryView(),
              ),
              GoRoute(
                path: AppRoutes.jobOrderDetails,
                builder: (context, state) => const JobOrderDetailsView(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.dailyLog,
                builder: (context, state) => const DailyLogView(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder:
                    (context, state) => BlocProvider.value(
                      value: sl<SettingsCubit>(),
                      child: const SettingsView(),
                    ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
