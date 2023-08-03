import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';

sealed class TaskEvent {}

class GetTasks extends TaskEvent {}

class PostTask extends TaskEvent {
  final TaskEntity task;
  PostTask({required this.task});
}

class DeleteTask extends TaskEvent {
  final TaskEntity task;
  DeleteTask({required this.task});
}
