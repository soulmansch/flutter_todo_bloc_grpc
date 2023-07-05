//
//  Generated code. Do not modify.
//  source: task_item.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'task_item.pb.dart' as $0;

export 'task_item.pb.dart';

@$pb.GrpcServiceName('todo_grpc.TaskService_grpc')
class TaskService_grpcClient extends $grpc.Client {
  static final _$createTask =
      $grpc.ClientMethod<$0.TaskItem_grpc, $0.TaskItem_grpc>(
          '/todo_grpc.TaskService_grpc/CreateTask',
          ($0.TaskItem_grpc value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskItem_grpc.fromBuffer(value));
  static final _$updateTask =
      $grpc.ClientMethod<$0.TaskItem_grpc, $0.TaskItem_grpc>(
          '/todo_grpc.TaskService_grpc/UpdateTask',
          ($0.TaskItem_grpc value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskItem_grpc.fromBuffer(value));
  static final _$deleteTask =
      $grpc.ClientMethod<$0.TaskItem_grpc, $0.DeleteTaskResponse>(
          '/todo_grpc.TaskService_grpc/DeleteTask',
          ($0.TaskItem_grpc value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteTaskResponse.fromBuffer(value));
  static final _$streamUpdates =
      $grpc.ClientMethod<$0.EmptyMessage_grpc, $0.TaskList>(
          '/todo_grpc.TaskService_grpc/StreamUpdates',
          ($0.EmptyMessage_grpc value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskList.fromBuffer(value));
  static final _$getTasks =
      $grpc.ClientMethod<$0.EmptyMessage_grpc, $0.TaskList>(
          '/todo_grpc.TaskService_grpc/GetTasks',
          ($0.EmptyMessage_grpc value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskList.fromBuffer(value));

  TaskService_grpcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TaskItem_grpc> createTask($0.TaskItem_grpc request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskItem_grpc> updateTask($0.TaskItem_grpc request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteTaskResponse> deleteTask(
      $0.TaskItem_grpc request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTask, request, options: options);
  }

  $grpc.ResponseStream<$0.TaskList> streamUpdates($0.EmptyMessage_grpc request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamUpdates, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.TaskList> getTasks($0.EmptyMessage_grpc request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTasks, request, options: options);
  }
}

@$pb.GrpcServiceName('todo_grpc.TaskService_grpc')
abstract class TaskService_grpcServiceBase extends $grpc.Service {
  $core.String get $name => 'todo_grpc.TaskService_grpc';

  TaskService_grpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TaskItem_grpc, $0.TaskItem_grpc>(
        'CreateTask',
        createTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskItem_grpc.fromBuffer(value),
        ($0.TaskItem_grpc value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskItem_grpc, $0.TaskItem_grpc>(
        'UpdateTask',
        updateTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskItem_grpc.fromBuffer(value),
        ($0.TaskItem_grpc value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskItem_grpc, $0.DeleteTaskResponse>(
        'DeleteTask',
        deleteTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskItem_grpc.fromBuffer(value),
        ($0.DeleteTaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyMessage_grpc, $0.TaskList>(
        'StreamUpdates',
        streamUpdates_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.EmptyMessage_grpc.fromBuffer(value),
        ($0.TaskList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyMessage_grpc, $0.TaskList>(
        'GetTasks',
        getTasks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EmptyMessage_grpc.fromBuffer(value),
        ($0.TaskList value) => value.writeToBuffer()));
  }

  $async.Future<$0.TaskItem_grpc> createTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TaskItem_grpc> request) async {
    return createTask(call, await request);
  }

  $async.Future<$0.TaskItem_grpc> updateTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TaskItem_grpc> request) async {
    return updateTask(call, await request);
  }

  $async.Future<$0.DeleteTaskResponse> deleteTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TaskItem_grpc> request) async {
    return deleteTask(call, await request);
  }

  $async.Stream<$0.TaskList> streamUpdates_Pre($grpc.ServiceCall call,
      $async.Future<$0.EmptyMessage_grpc> request) async* {
    yield* streamUpdates(call, await request);
  }

  $async.Future<$0.TaskList> getTasks_Pre($grpc.ServiceCall call,
      $async.Future<$0.EmptyMessage_grpc> request) async {
    return getTasks(call, await request);
  }

  $async.Future<$0.TaskItem_grpc> createTask(
      $grpc.ServiceCall call, $0.TaskItem_grpc request);
  $async.Future<$0.TaskItem_grpc> updateTask(
      $grpc.ServiceCall call, $0.TaskItem_grpc request);
  $async.Future<$0.DeleteTaskResponse> deleteTask(
      $grpc.ServiceCall call, $0.TaskItem_grpc request);
  $async.Stream<$0.TaskList> streamUpdates(
      $grpc.ServiceCall call, $0.EmptyMessage_grpc request);
  $async.Future<$0.TaskList> getTasks(
      $grpc.ServiceCall call, $0.EmptyMessage_grpc request);
}
