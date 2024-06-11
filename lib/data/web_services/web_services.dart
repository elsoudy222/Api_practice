import 'dart:io';

import 'package:api/data/models/users.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("users")
  Future<List<Users>> getAllUsers();

  @GET("users/{id}")
  Future<Users> getUserById(@Path("id") int userId);

  @DELETE("users/{id}")
  Future<dynamic> deleteUserById(
    @Path("id") int userId,
    @Header("Authorization") String token,
  );

  @POST("users")
  Future<Users> createNewUser(
    @Body() Users user,
    @Header("Authorization") String token,
  );
}
