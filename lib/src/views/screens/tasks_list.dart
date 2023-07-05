import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc_grpc/src/views/widgets/task_row.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/tasks/tasks_bloc.dart';
import '../widgets/nothing_to_show.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  @override
  void initState() {
    // GetIt.instance.get<TasksBloc>().add(GetTasksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<TasksBloc, TasksState>(
        bloc: GetIt.instance.get<TasksBloc>(),
        builder: (context, state) {
          if (state is TasksLoading) {
            // Show a loading indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TasksLoaded) {
            // Display the list of tasks
            final tasks = state.tasks;
            if (tasks.isEmpty) {
              return const NothingToShow();
            }
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskRow(task: task);
              },
            );
          } else if (state is TasksError) {
            // Show an error message
            return Center(
              child: Text(state.error),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
