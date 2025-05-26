import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension SizeExtensions on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}

extension QueryParamsExtension on BuildContext {
  String? queryParam(String key) {
    final uri = GoRouterState.of(this).uri;
    return uri.queryParameters[key];
  }
}

extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool isEmail () {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }
}
