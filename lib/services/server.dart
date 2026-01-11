import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'random_user_service.dart';
import '../models/user.dart';

void main() async {
  final dio = Dio();
  final client = RandomUserClient(dio);

  final app = Router();

  // Multiple users endpoint
  app.get('/users', (shelf.Request req) async {
    try {
      final RandomUserResponse response = await client.getRandomUsers(20);

      // Map User objects to JSON using the generated toJson()
      final users = response.results.map((user) => user.toJson()).toList();

      return shelf.Response.ok(
        jsonEncode(users),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return shelf.Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  });

  final server = await io.serve(app, 'localhost', 8080);
  print('Server listening on port ${server.port}');
}

