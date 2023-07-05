import 'package:flutter/material.dart';
import 'package:flutter_todo_bloc_grpc/src/bloc/server/server_cubit.dart';
import 'package:flutter_todo_bloc_grpc/src/bloc/tasks/tasks_bloc.dart';
import 'package:flutter_todo_bloc_grpc/src/data/storage_simulator.dart';
import 'package:flutter_todo_bloc_grpc/src/views/app.dart';
import 'package:get_it/get_it.dart';

void main() async {
  // Initialize GetIt for dependency injection
  final getIt = GetIt.instance;

  // Register instances

  getIt.registerSingleton<ServerCubit>(ServerCubit());
  await getIt
      .get<ServerCubit>()
      .connect(getIt.get<ServerCubit>().host, getIt.get<ServerCubit>().port);

  getIt.registerSingleton<TasksBloc>(TasksBloc());
  getIt.registerSingleton<StorageSimulator>(StorageSimulator());

  runApp(const MyApp());
}
