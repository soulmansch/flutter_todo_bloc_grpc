import 'package:flutter/material.dart';
import 'package:flutter_todo_bloc_grpc/src/bloc/tasks/tasks_bloc.dart';
import 'package:flutter_todo_bloc_grpc/src/views/pages/add_edit_task_screen/add_edit_task_screen_view.dart';
import 'package:get_it/get_it.dart';

import '../../../data/models/task_model.dart';

// ignore: must_be_immutable
class TaskScreen extends StatelessWidget {
  final TaskModel task;

  const TaskScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
        title: const Text('Task Details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddEditTaskScreen(
                          task: task,
                        )),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              GetIt.instance.get<TasksBloc>().add(DeleteTaskEvent(task));
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Title",
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Text(
                task.title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Content",
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Text(
                task.content,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              const Divider(),
              Text(
                'Status: ${task.status.name}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Created: ${task.created}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Last Modified: ${task.lastModified}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
