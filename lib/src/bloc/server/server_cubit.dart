import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grpc/grpc.dart';

import '../../util/constants/enums.dart';

part 'server_state.dart';

class ServerCubit extends Cubit<ServerState> {
  String host;
  int port;
  ClientChannel? _channel;

  ServerCubit({this.host = "localhost", this.port = 56294})
      : super(const ServerState(ServerStatusEnum.connecting));

  ClientChannel? get channel => _channel;

  Future<void> setUpChannel() async {
    await closeChannel();
    const options = ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      // idleTimeout: Duration(seconds: 10),
      // connectionTimeout: Duration(seconds: 10),
    );
    _channel = ClientChannel(
      host,
      port: port,
      options: options,
    );
    _channel!.createConnection();
  }

  Future<void> closeChannel() async {
    if (_channel == null) {
      return;
    }
    try {
      await _channel?.terminate();
      _channel = null;
      print('Disconnected.');
    } catch (e) {
      print(e);
    }
  }

  Future<void> connect(String h, int p) async {
    host = h;
    port = p;

    print('Connecting to $host:$port...');

    try {
      await setUpChannel();
      emit(const ServerState(ServerStatusEnum.connecting));
      print('Connection created.');

      final clientConnection = await _channel?.getConnection();

      clientConnection?.onStateChanged = (event) {
        ServerStatusEnum status = ServerStatusEnum.disconnected;
        if (event == ConnectionState.ready) {
          status = ServerStatusEnum.connected;
        } else if (event == ConnectionState.connecting) {
          status = ServerStatusEnum.connecting;
        }
        emit(ServerState(status));
        print('Connection state changed: ${status.name}');
      };
      // TODO remove the line bellow
      emit(const ServerState(ServerStatusEnum.connected));
    } catch (e) {
      print('Connection error: $e');
    }
  }

  Future<void> disconnect() async {
    try {
      await closeChannel();
    } catch (e) {
      print('Error while disconnecting: $e');
    }
  }
}
