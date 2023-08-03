import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';
import 'package:bloc_integration/app/features/tasks/domain/repositories/task_repository.dart';

abstract interface class GetTasksUseCase {
  Future<List<TaskEntity>> getTasks();
}

class GetTasksUseCaseImpl implements GetTasksUseCase {
  final TaskRepository taskRepository;
  GetTasksUseCaseImpl({
    required this.taskRepository,
  });
  @override
  Future<List<TaskEntity>> getTasks() async {
    return taskRepository.getTasks();
  }
}
