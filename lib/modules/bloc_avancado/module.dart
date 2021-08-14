import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'bloc_bloc.dart';
import 'bloc_page.dart';

class InjecaoModule extends Module{

  @override
    final List<Bind<Object>>  binds = [
      Bind.factory((i) => Dio()),
      Bind.singleton((i) => BlockBlock(i()))
    ];

    @override
     final List<ModularRoute>  routes = [
       ChildRoute('/', child: (_,__) => BlocPage())
     ];
}
