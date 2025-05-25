import 'package:flutter/material.dart';
import 'package:miss_misq/core/di/dependency_injcection.dart';
import 'package:miss_misq/core/networking/cache_helper.dart';
import 'package:miss_misq/miss_misq_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDepenencyInjection();
  await CachHelper.initCache();
  runApp(const MissMisqApp());
}
