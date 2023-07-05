import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc_grpc/src/views/widgets/disconnected_widget.dart';
import 'package:get_it/get_it.dart';

import '../../../bloc/server/server_cubit.dart';
import '../../../util/constants/enums.dart';
import '../../widgets/server_connection_badge.dart';
import '../../widgets/server_settings_dialog.dart';
import '../../screens/tasks_list.dart';
import '../add_edit_task_screen/add_edit_task_screen_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerCubit, ServerState>(
        bloc: GetIt.instance.get<ServerCubit>(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Todo'),
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ServerSettingsDialog(),
                      );
                    },
                    icon: const Icon(Icons.settings))
              ],
            ),
            body: Column(
              children: [
                if (state.status == ServerStatusEnum.connected)
                  const Expanded(child: TaskListWidget()),
                if (state.status == ServerStatusEnum.disconnected)
                  const Expanded(child: DisconnectedWidget()),
                if (state.status == ServerStatusEnum.connecting)
                  const Expanded(
                      child: Center(
                    child: CircularProgressIndicator(),
                  )),
                ServerConnectionBadget(connectionStatus: state.status)
              ],
            ),
            floatingActionButton: state.status == ServerStatusEnum.connected
                ? FloatingActionButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddEditTaskScreen()),
                    ),
                    child: const Icon(Icons.add),
                  )
                : null,
          );
        });
  }
}
