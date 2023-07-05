// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/task_model.dart';
import '../../data/providers/task_service_grpc_provider.dart';
import '../../util/functions/general_functions.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksLoading()) {
    on<GetTasksEvent>(getTasksEvent);
    on<CreateTaskEvent>(createTaskEvent);
    on<UpdateTaskEvent>(updateTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
  }

  FutureOr<void> getTasksEvent(
      GetTasksEvent event, Emitter<TasksState> emit) async {
    try {
      // Get tasks from the server
      final tasks = await TaskDataProvider().getTasks();
      getStoredTasks().clear();
      getStoredTasks().addAll(tasks);
      emit(TasksLoaded(getStoredTasks()));
    } catch (error) {
      print(error);
      emit(TasksError(error.toString()));
    }
  }

  FutureOr<void> createTaskEvent(
      CreateTaskEvent event, Emitter<TasksState> emit) async {
    try {
      // Create task on the server
      final newTask = await TaskDataProvider().createTask(event.task);
      getStoredTasks().add(newTask);
      emit(TasksLoaded(getStoredTasks()));
    } catch (error) {
      emit(TasksError(error.toString()));
    }
  }

  FutureOr<void> updateTaskEvent(
      UpdateTaskEvent event, Emitter<TasksState> emit) async {
    try {
      // Update task on the server
      final updatedTask = await TaskDataProvider().updateTask(event.task);
      final updatedTasks = getStoredTasks().map((task) {
        if (task.id == updatedTask.id) {
          return updatedTask;
        } else {
          return task;
        }
      }).toList();
      getStoredTasks().clear();
      getStoredTasks().addAll(updatedTasks);
      emit(TasksLoaded(getStoredTasks()));
    } catch (error) {
      emit(TasksError(error.toString()));
    }
  }

  FutureOr<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TasksState> emit) async {
    try {
      // Delete task on the server
      await TaskDataProvider().deleteTask(event.task);
      final updatedTasks =
          getStoredTasks().where((task) => task.id != event.task.id).toList();
      getStoredTasks().clear();
      getStoredTasks().addAll(updatedTasks);
      emit(TasksLoaded(getStoredTasks()));
    } catch (error) {
      emit(TasksError(error.toString()));
    }
  }
}
