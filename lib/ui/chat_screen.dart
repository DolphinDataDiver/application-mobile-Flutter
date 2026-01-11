import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../api/rag_api.dart';
import '../models/rag_response.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

// ChatScreen widget to handle user interaction and display chat messages
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  late RagApi api;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    api = RagApi(Dio()); // Initialize Retrofit API
  }

  // Function to ask the API and get the answer
  Future<String> askRag(String question) async {
    try {
      RagResponse resp = await api.askQuestion({"question": question});
      return resp.answer;
    } catch (e) {
      return "Erreur API : $e";
    }
  }

  // Function to send a message
  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _controller.clear();
      _isLoading = true;
    });

    final answer = await askRag(text);

    setState(() {
      _messages.add(ChatMessage(text: answer, isUser: false));
      _isLoading = false;
    });
  }

  // Function to display message bubbles
  Widget _bubble(ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: msg.isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          msg.text,
          style: TextStyle(
            color: msg.isUser ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chatbot RAG")),
      body: Column(
        children: [
          // Chat messages display area
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _bubble(_messages[i]),
            ),
          ),

          // Loading indicator
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),

          const Divider(height: 1),

          // Input area for user message
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Écrire un message...",
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.indigo),
                  onPressed: _sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



