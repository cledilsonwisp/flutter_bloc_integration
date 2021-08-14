import 'package:bloc_empresas/material_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/bloc_avancado/module.dart';
import 'modules/bloc_simples/my_home_page_module.dart';


class MainModuleHome extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: MyHomePageModule()),
        ModuleRoute('/module2', module: InjecaoModule()),
      ];
}
