import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/random_user_response.dart';

part 'random_user_service.g.dart';

@RestApi(baseUrl: "http://127.0.0.1:5000")
abstract class RandomUserClient {
  factory RandomUserClient(Dio dio, {String? baseUrl}) = _RandomUserClient;

  @GET("/users")  // Add leading slash here
  Future<RandomUserResponse> getRandomUsers(
    @Query("results") int results,
  );
}


