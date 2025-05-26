import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

ToastificationItem showToastification({
  required String message,
  required ToastificationType? type,
}) {
  return Toastification().show(
    title: Text(message),
    type: type ?? ToastificationType.success,
    alignment: AlignmentDirectional.topStart,
    direction: TextDirection.rtl,
    autoCloseDuration: const Duration(seconds: 2),
  );
}
