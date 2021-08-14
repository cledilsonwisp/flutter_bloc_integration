import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'my_home_page.dart';
import 'my_home_page_bloc.dart';

class MyHomePageModule extends Module {
  @override
  List<Bind> get binds =>
      [Bind.factory((i) => Dio()), Bind((i) => MyHomePageBloc(dio: (i())))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => MyHomePage()),
      ];

  static Inject get to => Inject<MyHomePageModule>();
}
