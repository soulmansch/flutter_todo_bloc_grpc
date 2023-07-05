//
//  Generated code. Do not modify.
//  source: task_item.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TaskStatus_grpc extends $pb.ProtobufEnum {
  static const TaskStatus_grpc TASK_STATUS_PENDING = TaskStatus_grpc._(0, _omitEnumNames ? '' : 'TASK_STATUS_PENDING');
  static const TaskStatus_grpc TASK_STATUS_COMPLETED = TaskStatus_grpc._(1, _omitEnumNames ? '' : 'TASK_STATUS_COMPLETED');

  static const $core.List<TaskStatus_grpc> values = <TaskStatus_grpc> [
    TASK_STATUS_PENDING,
    TASK_STATUS_COMPLETED,
  ];

  static final $core.Map<$core.int, TaskStatus_grpc> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TaskStatus_grpc? valueOf($core.int value) => _byValue[value];

  const TaskStatus_grpc._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
