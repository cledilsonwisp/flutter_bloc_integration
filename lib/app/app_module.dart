import 'package:bloc_integration/app/features/splash/ui/splash_page.dart';
import 'package:bloc_integration/app/features/tasks/ui/task_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => SplashPage()),
        ModuleRoute('/taskModule', module: TaskModule()),
      ];
}
