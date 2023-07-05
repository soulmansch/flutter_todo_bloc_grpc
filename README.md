# Flutter Technical Assignment -  ByteLeap Software Ltd. DBA PokerLab

This repository contains the server files and Flutter app for the Flutter Technical Assignment -  ByteLeap Software Ltd. DBA PokerLab.

## Server

The server files are located in the `/server` folder. To run the server, follow these steps:

1. Open a terminal and navigate to the `/server` folder: `cd server`
2. Install the dependencies: `npm install`
3. Start the server using the device IP address and a free port:
   - If you want to use the default settings, simply run: `npm start`
   - You can also specify the host and port by adding them to the command, for example:
     `npm start --host=localhost --port=5050`

## App Setup

To connect the app to the server, you have two options:

1. Modify the server host and port parameters in the `ServerCubit` file:
   - Open the file: `/lib/src/bloc/server/server_cubit.dart`
   - Locate the `ServerCubit` class and modify the `host` and `port` variables according to your server settings:

     ```dart
     ServerCubit({this.host = "Your_host_here", this.port = custom_port})
         : super(const ServerState(ServerStatusEnum.connecting));
     ```

2. Connect and disconnect to the server in runtime:
   - Launch the app and navigate to the home page.
   - Click on the settings icon at the top right of the screen.
   - In the settings menu, you can connect or disconnect from the server.
   - Additionally, you can change the host and port settings.

That's it! You can now run the server and connect the Flutter app to it using either the default server settings or by modifying the `ServerCubit` file or through the runtime settings menu.

Feel free to explore the code.
