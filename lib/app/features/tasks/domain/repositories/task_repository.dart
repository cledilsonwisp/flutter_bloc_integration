

import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';

abstract interface class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<List<TaskEntity>> postTasks({required TaskEntity task});
  Future<List<TaskEntity>> deleteTasks({required TaskEntity task});
}
