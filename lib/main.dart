import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'main_module.dart';
import 'material_app.dart';
import 'modules/bloc_avancado/module.dart';

void main() {
  runApp(
    ModularApp(
      module: InjecaoModule(), //trocar por MyHomePageModular para bloc_simples
      child: MyApp(),
    ),
  );
}
