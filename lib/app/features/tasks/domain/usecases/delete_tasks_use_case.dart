import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';
import 'package:bloc_integration/app/features/tasks/domain/repositories/task_repository.dart';

abstract interface class DeleteTasksUseCase {
  Future<List<TaskEntity>> deleteTasks({required TaskEntity task});
}

class DeleteTasksUseCaseImpl implements DeleteTasksUseCase {
  final TaskRepository taskRepository;
  DeleteTasksUseCaseImpl({
    required this.taskRepository,
  });
  @override
  Future<List<TaskEntity>> deleteTasks({required TaskEntity task}) async {
    return taskRepository.deleteTasks(task: task);
  }
}
