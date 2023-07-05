import 'package:flutter/material.dart';
import 'package:flutter_todo_bloc_grpc/src/data/repositories/grpc_server/task_item.pbgrpc.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:get_it/get_it.dart';

import '../../data/models/task_model.dart';
import '../../data/storage_simulator.dart';
import '../constants/enums.dart';

// Get stored tasks
List<TaskModel> getStoredTasks() {
  return GetIt.instance.get<StorageSimulator>().tasks;
}

// Retrieve the Enum object from stored name
T? getEnumObjectFromName<T>(String storedValue, List<T> enumValues) {
  for (var value in enumValues) {
    if (value.toString() == storedValue) {
      return value;
    }
  }
  return null;
}

// Converts timestamp from grpc server to datetime
DateTime convertFromTimestampGrpc(Timestamp_grpc timestampGrpc) {
  final seconds = timestampGrpc.seconds.toInt();
  final nanos = timestampGrpc.nanos;

  return DateTime.fromMillisecondsSinceEpoch(seconds * 1000, isUtc: true)
      .add(Duration(microseconds: nanos ~/ 1000));
}

// Converts Datetime to grpc timestamps
Timestamp_grpc convertToTimestampGrpc(DateTime dateTime) {
  final millisecondsSinceEpoch = dateTime.millisecondsSinceEpoch;
  final seconds = $fixnum.Int64(millisecondsSinceEpoch ~/ 1000);
  final nanos = (millisecondsSinceEpoch % 1000) * 1000;

  return Timestamp_grpc()
    ..seconds = seconds
    ..nanos = nanos;
}

// Converts status from grpc to status enum
TaskStatusEnum convertStatusFromProto(TaskStatus_grpc status) {
  switch (status) {
    case TaskStatus_grpc.TASK_STATUS_PENDING:
      return TaskStatusEnum.pending;
    case TaskStatus_grpc.TASK_STATUS_COMPLETED:
      return TaskStatusEnum.completed;
    default:
      return TaskStatusEnum.pending;
  }
}

// Converts status enum to grpc status
TaskStatus_grpc convertStatusToProto(TaskStatusEnum status) {
  switch (status) {
    case TaskStatusEnum.pending:
      return TaskStatus_grpc.TASK_STATUS_PENDING;
    case TaskStatusEnum.completed:
      return TaskStatus_grpc.TASK_STATUS_COMPLETED;
    default:
      return TaskStatus_grpc.TASK_STATUS_PENDING;
  }
}

// Convert task from grpc to TaskModel
TaskModel convertFromGrpcTask(TaskItem_grpc grpcTask) {
  return TaskModel(
    id: grpcTask.id,
    title: grpcTask.title,
    content: grpcTask.content,
    status: convertStatusFromProto(grpcTask.status),
    created: convertFromTimestampGrpc(grpcTask.created),
    lastModified: convertFromTimestampGrpc(grpcTask.lastModified),
  );
}

// Converts TaskModel to grpc task
TaskItem_grpc convertToGrpcTask(TaskModel task) {
  return TaskItem_grpc()
    ..id = task.id
    ..title = task.title
    ..content = task.content
    ..status = convertStatusToProto(task.status)
    ..created = convertToTimestampGrpc(task.created)
    ..lastModified = convertToTimestampGrpc(task.lastModified);
}

// To display few words from a long string
String limitString(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}

// Snackbars
void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
