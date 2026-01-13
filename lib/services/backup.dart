import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'random_user_service.dart';
import '../models/random_user_response.dart';

void main() async {
  final dio = Dio();
  final client = RandomUserClient(dio);
  final app = Router();

  // Multiple users endpoint
  app.get('/users', (shelf.Request req) async {
    try {
      final RandomUserResponse response = await client.getRandomUsers(20);
      final users = response.results.map((user) {
        return {
          "profile": {
            "firstName": user.profile.firstName,
            "lastName": user.profile.lastName,
            "email": user.profile.email,
          },
          "username": user.username,
          "department": user.department,
          "avatar": user.avatar,
          "knownIps": user.knownIps,
          "lastLoginAttempt": user.lastLoginAttempt,
          "lastLoginIp": user.lastLoginIp,
          "staticData": user.staticData,
        };
      }).toList();

      return shelf.Response.ok(jsonEncode(users), headers: {
        'Content-Type': 'application/json'
      });
    } catch (e) {
      return shelf.Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
      );
    }
  });

  final server = await io.serve(app, 'localhost', 8080);
  print('Server listening on port ${server.port}');
}

