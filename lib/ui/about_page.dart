import 'package:flutter/material.dart';
import 'app_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text("About Me")),
      body: const Center(
        child: Text(
          "Cette application démontre :\n\n"
          "• La consommation d’API REST\n"
          "• Le RAG avec OpenAI\n"
          "• Une architecture Flutter + FastAPI\n\n"
          "Elle fournit une assistance à la gestion des identités basée sur l’IA, "
          "capable d’analyser des informations liées aux utilisateurs et à la sécurité "
          "afin de répondre avec précision aux questions de sécurité.\n\n"
          "Auteur : Vous",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

