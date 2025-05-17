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