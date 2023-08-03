import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';
import 'package:bloc_integration/app/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<TaskEntity> _tasks = [];

  @override
  Future<List<TaskEntity>> getTasks() async {
    _tasks.addAll(
      [
        TaskEntity(name: "Compras no mercado"),
        TaskEntity(name: "Ração para o cachorro"),
        TaskEntity(name: "Alimentar o gato"),
        TaskEntity(name: "Reformar o quarto"),
      ],
    );
    return Future.delayed(const Duration(seconds: 2), () => _tasks);
  }

  @override
  Future<List<TaskEntity>> postTasks({required TaskEntity task}) async {
    _tasks.add(task);
    return Future.delayed(const Duration(seconds: 2), () => _tasks);
  }

  @override
  Future<List<TaskEntity>> deleteTasks({required TaskEntity task}) async {
    _tasks.remove(task);
    return Future.delayed(const Duration(seconds: 2), () => _tasks);
  }
}
