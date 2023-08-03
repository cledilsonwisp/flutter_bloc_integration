import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';
import 'package:bloc_integration/app/features/tasks/domain/repositories/task_repository.dart';

abstract interface class PostTasksUseCase {
  Future<List<TaskEntity>> postTasks({required TaskEntity task});
}

class PostTasksUseCaseImpl implements PostTasksUseCase {
  final TaskRepository taskRepository;
  PostTasksUseCaseImpl({
    required this.taskRepository,
  });
  @override
  Future<List<TaskEntity>> postTasks({required TaskEntity task}) async {
    return taskRepository.postTasks(task: task);
  }
}
