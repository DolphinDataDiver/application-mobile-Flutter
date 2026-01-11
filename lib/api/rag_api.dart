import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/rag_response.dart';

part 'rag_api.g.dart';

@RestApi(baseUrl: "http://localhost:8000") // Android Emulator
abstract class RagApi {
  // Factory constructor to initialize RagApi
  factory RagApi(Dio dio, {String? baseUrl}) = _RagApi;

  // POST request to ask a question to the server
  @POST("/rag-chat")
  Future<RagResponse> askQuestion(@Body() Map<String, dynamic> body);
}


