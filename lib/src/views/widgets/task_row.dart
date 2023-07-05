// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';
import '../../util/constants/enums.dart';
import '../../util/functions/general_functions.dart';
import '../pages/task_screen/task_screen_view.dart';

class TaskRow extends StatelessWidget {
  final TaskModel task;
  const TaskRow({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(limitString(task.content, 200)),
      trailing: task.status == TaskStatusEnum.completed
          ? const Icon(Icons.check_circle)
          : null,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TaskScreen(
                    task: task,
                  )),
        );
      },
    );
  }
}
