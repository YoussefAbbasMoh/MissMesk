import 'package:flutter/material.dart';
import 'package:miss_misq/core/di/dependency_injcection.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';
import 'package:miss_misq/core/widgets/are_you_sure_dialog.dart';
import 'package:miss_misq/core/widgets/table_custom_icon.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: const Color(0XFFAD0A0A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      ),
      onPressed: () {
        final settingsCubit = sl<SettingsCubit>();
        showDialog(
          context: context,
          builder:
              (context) => AreYouSureDialog(
                title: 'هل تريد حذف هذا الحساب؟',
                cubit: settingsCubit,
                onConfirm: () => settingsCubit.deleteAccount(id: id),
              ),
        );
      },

      icon: TableCustomIcon(AssetsManager.delete, color: Colors.white),
    );
  }
}
