part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends TasksEvent {}

class GetTasksEvent extends TasksEvent {}

class CreateTaskEvent extends TasksEvent {
  final TaskModel task;

  const CreateTaskEvent(this.task);
}

class UpdateTaskEvent extends TasksEvent {
  final TaskModel task;

  const UpdateTaskEvent(this.task);
}

class DeleteTaskEvent extends TasksEvent {
  final TaskModel task;

  const DeleteTaskEvent(this.task);
}
