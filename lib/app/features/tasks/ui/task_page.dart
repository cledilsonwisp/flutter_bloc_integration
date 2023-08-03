import 'package:bloc_integration/app/features/tasks/domain/entities/task_entity.dart';
import 'package:bloc_integration/app/features/tasks/ui/bloc/task_bloc.dart';
import 'package:bloc_integration/app/features/tasks/ui/bloc/task_event.dart';
import 'package:bloc_integration/app/features/tasks/ui/bloc/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final taskBloc = Modular.get<TaskBloc>();

  @override
  void initState() {
    super.initState();
    taskBloc.add(GetTasks());
  }

  @override
  void dispose() {
    taskBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks App')),
      body: BlocBuilder<TaskBloc, TaskState>(
          bloc: taskBloc,
          builder: (context, state) {
            return Center(
              child: switch (state) {
                TaskLoadingState _ => const CircularProgressIndicator(),
                TaskInitialState _ => Container(),
                TasErrorState _ => const Center(
                    child: Text('Error'),
                  ),
                TaskLoadedState _ => ListView.separated(
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            child: Center(
                              child: Text(state.tasks[index].name[0]),
                            ),
                          ),
                          title: Text(state.tasks[index].name),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_rounded),
                            onPressed: () {
                              taskBloc
                                  .add(DeleteTask(task: state.tasks[index]));
                            },
                          ),
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.tasks.length),
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskBloc.add(PostTask(task: TaskEntity(name: "New Task Here")));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
