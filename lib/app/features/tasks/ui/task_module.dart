import 'package:bloc_integration/app/features/tasks/infra/dataSource/task_repository_impl.dart';
import 'package:bloc_integration/app/features/tasks/ui/bloc/task_bloc.dart';
import 'package:bloc_integration/app/features/tasks/ui/task_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => TaskRepositoryImpl()),
        Bind.singleton((i) => TaskBloc(taskRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => TaskPage()),
      ];

  static Inject get to => Inject<TaskModule>();
}
