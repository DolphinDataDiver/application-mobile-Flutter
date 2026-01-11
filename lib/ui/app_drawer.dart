import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/photo.jpg"),
              ),
            ),
          ),

          // Home
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home", style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),

          // About Me
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("About Me", style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

