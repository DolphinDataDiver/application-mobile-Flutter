import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/random_user_response.dart';

part 'random_user_service.g.dart';

// Update the base URL to point to your Flask server
@RestApi(baseUrl: "http://127.0.0.1:5000") // Make sure to use the correct IP and port
abstract class RandomUserClient {
  factory RandomUserClient(Dio dio, {String? baseUrl}) = _RandomUserClient;


  // Method to fetch a list of random users
  @GET("users") // Adjusted to call the endpoint that returns a list of users
  Future<RandomUserResponse> getRandomUsers(
    @Query("results") int results, // Optional if you want to limit the number
  );
}

