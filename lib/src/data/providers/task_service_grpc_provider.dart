// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_todo_bloc_grpc/src/util/functions/general_functions.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/server/server_cubit.dart';
import '../models/task_model.dart';
import '../repositories/grpc_server/task_item.pbgrpc.dart';

class TaskDataProvider {
  TaskDataProvider();

  TaskService_grpcClient getClient() {
    final channel = GetIt.instance.get<ServerCubit>().channel;
    return TaskService_grpcClient(channel!);
  }

  Stream<TaskList> getTasksStream() {
    final request = EmptyMessage_grpc();
    return getClient().streamUpdates(request);
  }

  Future<TaskModel> createTask(TaskModel task) async {
    final TaskItem_grpc request = convertToGrpcTask(task);
    final response = await getClient().createTask(request);
    return convertFromGrpcTask(response);
  }

  Future<TaskModel> updateTask(TaskModel task) async {
    final TaskItem_grpc request = convertToGrpcTask(task);
    final response = await getClient().updateTask(request);
    return convertFromGrpcTask(response);
  }

  Future<void> deleteTask(TaskModel task) async {
    final TaskItem_grpc request = convertToGrpcTask(task);
    await getClient().deleteTask(request);
  }

  Future<List<TaskModel>> getTasks() async {
    final request = EmptyMessage_grpc();
    final response = await getClient().getTasks(request);
    return response.tasks.map((task) => convertFromGrpcTask(task)).toList();
  }
}
