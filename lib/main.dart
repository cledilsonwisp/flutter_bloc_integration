import 'package:bloc_integration/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}
