import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'chat_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text("Home")),
      body: const ChatScreen(),
    );
  }
}

