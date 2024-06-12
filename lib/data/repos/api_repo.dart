import 'package:api/core/exeptions/network_exeptions/network_exceptions.dart';
import 'package:api/data/web_services/web_services.dart';

import '../../core/exeptions/api_result/api_result.dart';
import '../models/users.dart';

class ApiRepo {
  final WebServices webServices;

  ApiRepo(this.webServices);

  Future<ApiResult<List<Users>>> getAllUsers() async {
    try{
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }

  }

  Future<Users> getUserById(int userId) async {
    var response = await webServices.getUserById(userId);
    //   var responseBody = Users.fromJson(response.toJson());
    return response;
  }
  Future<dynamic> deleteUserById(int userId) async {
    await webServices.deleteUserById(userId,
      "Bearer b8c67b8b0d7ec8fd34271dcc85942bd1edf9b4a02e95e1051311aa87e756eee2",);

  }

  Future<ApiResult<Users>> createNewUser(Users user) async {
    try{
      var response = await webServices.createNewUser(user,
        "Bearer b8c67b8b0d7ec8fd34271dcc85942bd1edf9b4a02e95e1051311aa87e756eee2",);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }


  }


}
