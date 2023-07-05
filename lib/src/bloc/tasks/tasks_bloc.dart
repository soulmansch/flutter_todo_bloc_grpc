import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../data/models/task_model.dart';
import '../../data/providers/task_service_grpc_provider.dart';
import '../../data/repositories/grpc_server/task_item.pb.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  StreamSubscription<TaskList>? _streamSubscription;

  TasksBloc() : super(TasksLoading()) {
    // Subscribe to the stream

    initiateStream();

    on<LoadingEvent>(
      (event, emit) => emit(TasksLoading()),
    );
    on<GetTasksEvent>(getTasksEvent);
    on<CreateTaskEvent>(createTaskEvent);
    on<UpdateTaskEvent>(updateTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
  }

  initiateStream() async {
    await _streamSubscription?.cancel();
    _streamSubscription = null;
    final taskDataProvider = TaskDataProvider();

    _streamSubscription =
        taskDataProvider.getTasksStream().listen((taskList) async {
      // await Future.delayed(Duration.zero);
      GetIt.instance.get<TasksBloc>().add(LoadingEvent());
      GetIt.instance.get<TasksBloc>().add(GetTasksEvent());
    });
  }

  Future<void> getTasksEvent(
      GetTasksEvent event, Emitter<TasksState> emit) async {
    try {
      final tasks = await TaskDataProvider().getTasks();
      emit(TasksLoaded(tasks));
    } catch (error) {
      emit(TasksError(error.toString()));
    }
  }

  Future<void> createTaskEvent(
      CreateTaskEvent event, Emitter<TasksState> emit) async {
    try {
      final taskDataProvider = TaskDataProvider();
      await taskDataProvider.createTask(event.task);
    } catch (error) {
      emit(TasksError(error.toString()));
    }
  }

  Future<void> updateTaskEvent(
      UpdateTaskEvent event, Emitter<TasksState> emit) async {
    try {
      final taskDataProvider = TaskDataProvider();
      await taskDataProvider.updateTask(event.task);
    } catch (error) {
      emit(TasksError(error.toString()));
    }
  }

  Future<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TasksState> emit) async {
    try {
      final taskDataProvider = TaskDataProvider();
      await taskDataProvider.deleteTask(event.task);
    } catch (error) {
      emit(TasksError(error.toString()));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
