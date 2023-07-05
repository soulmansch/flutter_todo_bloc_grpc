// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../util/constants/enums.dart';
import '../../util/functions/general_functions.dart';

class TaskModel extends Equatable {
  final String id;
  final String title;
  final String content;
  final TaskStatusEnum status;
  final DateTime created;
  final DateTime lastModified;
  const TaskModel({
    required this.id,
    required this.title,
    required this.content,
    required this.status,
    required this.created,
    required this.lastModified,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'status': status.name,
      'created': created.millisecondsSinceEpoch,
      'lastModified': lastModified.millisecondsSinceEpoch,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      content: map['content'] ?? "",
      status:
          getEnumObjectFromName(map["status"] ?? "", TaskStatusEnum.values) ??
              TaskStatusEnum.values.first,
      created: DateTime.fromMillisecondsSinceEpoch(
          map['created'] ?? DateTime.now().millisecondsSinceEpoch),
      lastModified: DateTime.fromMillisecondsSinceEpoch(
          map['lastModified'] ?? DateTime.now().millisecondsSinceEpoch),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // pb.Task toTask() {
  //   final task = pb.Task();
  //   task.id = id;
  //   task.title = title;
  //   task.content = content;
  //   task.status = _convertStatusToProto(status);
  //   task.created = _convertTimestampToProto(created);
  //   task.lastModified = _convertTimestampToProto(lastModified);
  //   return task;
  // }

  // // Helper method to convert TaskStatus to TaskStatus enum in the generated protobuf code
  // TaskStatus_grpc _convertStatusToProto(TaskStatusEnum? status) {
  //   if (status == null) {
  //     return TaskStatus_grpc.TASK_STATUS_PENDING;
  //   }

  //   switch (status) {
  //     case TaskStatusEnum.pending:
  //       return TaskStatus_grpc.TASK_STATUS_PENDING;
  //     case TaskStatusEnum.completed:
  //       return TaskStatus_grpc.TASK_STATUS_COMPLETED;
  //     default:
  //       throw ArgumentError('Invalid TaskStatus value: $status');
  //   }
  // }

  // // Helper method to convert DateTime to Timestamp in the generated protobuf code
  // ts.Timestamp _convertTimestampToProto(DateTime? dateTime) {
  //   if (dateTime == null) {
  //     return ts.Timestamp();
  //   }

  //   final millisecondsSinceEpoch = dateTime.millisecondsSinceEpoch;
  //   final seconds = Int64(millisecondsSinceEpoch ~/ 1000);
  //   final nanos = (millisecondsSinceEpoch % 1000) * 1000000;

  //   return ts.Timestamp()
  //     ..seconds = seconds
  //     ..nanos = nanos.toInt();
  // }

  @override
  List<Object> get props {
    return [id];
  }
}
