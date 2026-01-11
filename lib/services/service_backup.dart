import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/random_user_response.dart';


@RestApi(baseUrl: "https://randomuser.me/api/")
abstract class RandomUserClient {
  factory RandomUserClient(Dio dio, {String? baseUrl}) = _RandomUserClient;

  @GET("/")
  Future<RandomUserResponse> getRandomUser();

  @GET("/")
  Future<RandomUserResponse> getRandomUsers(
    @Query("results") int results,
  );
}

