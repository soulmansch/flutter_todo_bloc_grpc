import 'package:flutter/material.dart';

class DisconnectedWidget extends StatelessWidget {
  const DisconnectedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/disconnected.jpeg",
        width: double.infinity,
      ),
    );
  }
}
