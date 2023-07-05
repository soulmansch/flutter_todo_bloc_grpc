import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/server/server_cubit.dart';

class ServerSettingsDialog extends StatefulWidget {
  const ServerSettingsDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ServerSettingsDialogState createState() => _ServerSettingsDialogState();
}

class _ServerSettingsDialogState extends State<ServerSettingsDialog> {
  final _hostController = TextEditingController();
  final _portController = TextEditingController();

  @override
  void initState() {
    final serverCubit = GetIt.instance<ServerCubit>();
    _hostController.text = serverCubit.host;
    _portController.text = serverCubit.port.toString();
    super.initState();
  }

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }

  void _connect() {
    final host = _hostController.text;
    final port = int.tryParse(_portController.text) ?? 0;

    final serverCubit = GetIt.instance<ServerCubit>();
    serverCubit.connect(host, port);
    Navigator.pop(context);
  }

  void _disconnect() {
    final serverCubit = GetIt.instance<ServerCubit>();
    serverCubit.disconnect();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Server Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _hostController,
            decoration: const InputDecoration(
              labelText: 'IP Address',
            ),
          ),
          TextField(
            controller: _portController,
            decoration: const InputDecoration(
              labelText: 'Port',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: _connect,
          child: const Text('Connect'),
        ),
        ElevatedButton(
          onPressed: _disconnect,
          child: const Text('Disconnect'),
        ),
      ],
    );
  }
}
