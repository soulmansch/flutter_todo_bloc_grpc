part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final List<TaskModel> tasks;

  const TasksLoaded(this.tasks);
  @override
  List<Object> get props => [tasks];

  @override
  bool? get stringify => true;
}

class TasksError extends TasksState {
  final String error;

  const TasksError(this.error);
}
