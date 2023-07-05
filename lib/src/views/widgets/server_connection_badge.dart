import 'package:flutter/material.dart';
import 'package:flutter_todo_bloc_grpc/src/util/constants/enums.dart';

class ServerConnectionBadget extends StatelessWidget {
  final ServerStatusEnum connectionStatus;
  const ServerConnectionBadget({super.key, required this.connectionStatus});

  @override
  Widget build(BuildContext context) {
    if (connectionStatus != ServerStatusEnum.connected) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: connectionStatus == ServerStatusEnum.connecting
            ? Colors.blue
            : Colors.orangeAccent,
        child: Center(
          child: Text(
            connectionStatus.name.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
