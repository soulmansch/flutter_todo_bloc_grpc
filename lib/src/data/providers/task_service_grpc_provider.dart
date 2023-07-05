// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_todo_bloc_grpc/src/util/functions/general_functions.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/server/server_cubit.dart';
import '../models/task_model.dart';
import '../repositories/grpc_server/task_item.pbgrpc.dart';

class TaskDataProvider {
  late TaskService_grpcClient client;

  TaskDataProvider() {
    final channel = GetIt.instance.get<ServerCubit>().channel;
    client = TaskService_grpcClient(channel!);
  }

  Stream<TaskModel> getTasksStream() {
    final request = EmptyMessage_grpc();
    return client
        .streamUpdates(request)
        .asyncExpand((response) => Stream.fromIterable(response.tasks))
        .map((taskItem) => convertFromGrpcTask(taskItem));
  }

  Future<TaskModel> createTask(TaskModel task) async {
    final TaskItem_grpc request = convertToGrpcTask(task);
    final response = await client.createTask(request);
    return convertFromGrpcTask(response);
  }

  Future<TaskModel> updateTask(TaskModel task) async {
    final TaskItem_grpc request = convertToGrpcTask(task);
    final response = await client.updateTask(request);
    return convertFromGrpcTask(response);
  }

  Future<void> deleteTask(TaskModel task) async {
    final TaskItem_grpc request = convertToGrpcTask(task);
    await client.deleteTask(request);
  }

  Future<List<TaskModel>> getTasks() async {
    final request = EmptyMessage_grpc();
    final response = await client.getTasks(request);
    return response.tasks.map((task) => convertFromGrpcTask(task)).toList();
  }
}
