
import 'package:bloc/bloc.dart';
import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';
import 'package:bloc_integration/app/features/tasks/domain/repositories/task_repository.dart';
import 'package:bloc_integration/app/features/tasks/ui/bloc/task_event.dart';
import 'package:bloc_integration/app/features/tasks/ui/bloc/task_state.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc({
    required this.taskRepository,
  }) : super(TaskInitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(TaskEvent taskEvent, Emitter emit) async {
    List<TaskEntity> tasks = [];
    emit(TaskLoadingState());

    if (taskEvent is GetTasks) {
      tasks = await taskRepository.getTasks();
    } else if (taskEvent is PostTask) {
      tasks = await taskRepository.postTasks(task: taskEvent.task);
    } else if (taskEvent is DeleteTask) {
      tasks = await taskRepository.deleteTasks(task: taskEvent.task);
    }
    emit(TaskLoadedState(tasks: tasks));
  }
}
