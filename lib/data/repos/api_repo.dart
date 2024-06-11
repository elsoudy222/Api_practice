import 'package:api/data/web_services/web_services.dart';

import '../models/users.dart';

class ApiRepo {
  final WebServices webServices;

  ApiRepo(this.webServices);

  Future<List<Users>> getAllUsers() async {
    var response = await webServices.getAllUsers();
    // var responseBody =
    //     response.map((user) => Users.fromJson(user.toJson())).toList();
    // return responseBody;
    return response;
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

  Future<Users> createNewUser(Users user) async {
    var response = await webServices.createNewUser(user,
      "Bearer b8c67b8b0d7ec8fd34271dcc85942bd1edf9b4a02e95e1051311aa87e756eee2",);
    return response;
  }


}
