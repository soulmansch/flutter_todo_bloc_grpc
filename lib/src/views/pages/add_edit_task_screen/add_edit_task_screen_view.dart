import 'package:flutter/material.dart';
import 'package:flutter_todo_bloc_grpc/src/bloc/tasks/tasks_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/task_model.dart';
import '../../../util/constants/enums.dart';
import '../../../util/functions/general_functions.dart';

// ignore: must_be_immutable
class AddEditTaskScreen extends StatefulWidget {
  final TaskModel? task;

  const AddEditTaskScreen({super.key, this.task});

  @override
  _AddEditTaskScreenState createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TaskStatusEnum _status;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _contentController =
        TextEditingController(text: widget.task?.content ?? '');
    _status = widget.task?.status ?? TaskStatusEnum.pending;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveTask() {
    String taskId = widget.task?.id ?? const Uuid().v4();
    String title = _titleController.text;
    String content = _contentController.text;
    DateTime now = DateTime.now();

    if (title.trim().isEmpty) {
      showSnackbar(context, "Title required");
      return;
    }

    TaskModel task = TaskModel(
      id: taskId,
      title: title,
      content: content,
      status: _status,
      created: widget.task?.created ?? now,
      lastModified: now,
    );
    if (widget.task == null) {
      GetIt.instance.get<TasksBloc>().add(CreateTaskEvent(task));
    } else {
      GetIt.instance.get<TasksBloc>().add(UpdateTaskEvent(task));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
        title: Text(widget.task != null ? 'Edit Task' : 'Add Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: null,
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<TaskStatusEnum>(
                value: _status,
                onChanged: (value) {
                  setState(() {
                    _status = value!;
                  });
                },
                items: TaskStatusEnum.values.map((status) {
                  return DropdownMenuItem<TaskStatusEnum>(
                    value: status,
                    child: Text(status.name),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Status'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveTask,
                child: Text(widget.task == null ? 'Save' : "update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
