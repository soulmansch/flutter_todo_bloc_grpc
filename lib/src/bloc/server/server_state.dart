part of 'server_cubit.dart';

class ServerState extends Equatable {
  final ServerStatusEnum status;

  const ServerState(this.status);

  @override
  List<Object> get props => [status.name];
}
