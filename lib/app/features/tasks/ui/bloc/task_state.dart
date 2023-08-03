import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';

sealed class TaskState {
  final List<TaskEntity> tasks;

  TaskState({required this.tasks});
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(tasks: []);
}

class TaskLoadingState extends TaskState {
  TaskLoadingState() : super(tasks: []);
}

class TaskLoadedState extends TaskState {
  TaskLoadedState({required List<TaskEntity> tasks}) : super(tasks: tasks);
}

class TasErrorState extends TaskState {
  final Exception exception;
  TasErrorState({required this.exception}) : super(tasks: []);
}
