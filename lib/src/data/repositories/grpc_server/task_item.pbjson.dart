//
//  Generated code. Do not modify.
//  source: task_item.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use taskStatus_grpcDescriptor instead')
const TaskStatus_grpc$json = {
  '1': 'TaskStatus_grpc',
  '2': [
    {'1': 'TASK_STATUS_PENDING', '2': 0},
    {'1': 'TASK_STATUS_COMPLETED', '2': 1},
  ],
};

/// Descriptor for `TaskStatus_grpc`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List taskStatus_grpcDescriptor = $convert.base64Decode(
    'Cg9UYXNrU3RhdHVzX2dycGMSFwoTVEFTS19TVEFUVVNfUEVORElORxAAEhkKFVRBU0tfU1RBVF'
    'VTX0NPTVBMRVRFRBAB');

@$core.Deprecated('Use emptyMessage_grpcDescriptor instead')
const EmptyMessage_grpc$json = {
  '1': 'EmptyMessage_grpc',
};

/// Descriptor for `EmptyMessage_grpc`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyMessage_grpcDescriptor = $convert.base64Decode(
    'ChFFbXB0eU1lc3NhZ2VfZ3JwYw==');

@$core.Deprecated('Use timestamp_grpcDescriptor instead')
const Timestamp_grpc$json = {
  '1': 'Timestamp_grpc',
  '2': [
    {'1': 'seconds', '3': 1, '4': 1, '5': 3, '10': 'seconds'},
    {'1': 'nanos', '3': 2, '4': 1, '5': 5, '10': 'nanos'},
  ],
};

/// Descriptor for `Timestamp_grpc`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timestamp_grpcDescriptor = $convert.base64Decode(
    'Cg5UaW1lc3RhbXBfZ3JwYxIYCgdzZWNvbmRzGAEgASgDUgdzZWNvbmRzEhQKBW5hbm9zGAIgAS'
    'gFUgVuYW5vcw==');

@$core.Deprecated('Use taskItem_grpcDescriptor instead')
const TaskItem_grpc$json = {
  '1': 'TaskItem_grpc',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.todo_grpc.TaskStatus_grpc', '10': 'status'},
    {'1': 'created', '3': 5, '4': 1, '5': 11, '6': '.todo_grpc.Timestamp_grpc', '10': 'created'},
    {'1': 'last_modified', '3': 6, '4': 1, '5': 11, '6': '.todo_grpc.Timestamp_grpc', '10': 'lastModified'},
  ],
};

/// Descriptor for `TaskItem_grpc`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskItem_grpcDescriptor = $convert.base64Decode(
    'Cg1UYXNrSXRlbV9ncnBjEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSGA'
    'oHY29udGVudBgDIAEoCVIHY29udGVudBIyCgZzdGF0dXMYBCABKA4yGi50b2RvX2dycGMuVGFz'
    'a1N0YXR1c19ncnBjUgZzdGF0dXMSMwoHY3JlYXRlZBgFIAEoCzIZLnRvZG9fZ3JwYy5UaW1lc3'
    'RhbXBfZ3JwY1IHY3JlYXRlZBI+Cg1sYXN0X21vZGlmaWVkGAYgASgLMhkudG9kb19ncnBjLlRp'
    'bWVzdGFtcF9ncnBjUgxsYXN0TW9kaWZpZWQ=');

@$core.Deprecated('Use deleteTaskResponseDescriptor instead')
const DeleteTaskResponse$json = {
  '1': 'DeleteTaskResponse',
  '2': [
    {'1': 'deleted_task', '3': 1, '4': 1, '5': 11, '6': '.todo_grpc.TaskItem_grpc', '10': 'deletedTask'},
  ],
};

/// Descriptor for `DeleteTaskResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVUYXNrUmVzcG9uc2USOwoMZGVsZXRlZF90YXNrGAEgASgLMhgudG9kb19ncnBjLl'
    'Rhc2tJdGVtX2dycGNSC2RlbGV0ZWRUYXNr');

@$core.Deprecated('Use taskListDescriptor instead')
const TaskList$json = {
  '1': 'TaskList',
  '2': [
    {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.todo_grpc.TaskItem_grpc', '10': 'tasks'},
  ],
};

/// Descriptor for `TaskList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskListDescriptor = $convert.base64Decode(
    'CghUYXNrTGlzdBIuCgV0YXNrcxgBIAMoCzIYLnRvZG9fZ3JwYy5UYXNrSXRlbV9ncnBjUgV0YX'
    'Nrcw==');

