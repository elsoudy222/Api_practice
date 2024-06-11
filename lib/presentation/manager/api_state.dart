part of 'api_cubit.dart';

@immutable
sealed class ApiState {}

class ApiInitial extends ApiState {}

class SuccessGetAllUsers extends ApiState {

  final List<Users> users;
  SuccessGetAllUsers(this.users);
}

class SuccessGetUserById extends ApiState {

  final Users userDetails;
  SuccessGetUserById(this.userDetails);
}
class SuccessCreateNewUser extends ApiState {

  final Users newUser;
  SuccessCreateNewUser(this.newUser);
}
class SuccessDeleteUser extends ApiState {
  final dynamic data;
  SuccessDeleteUser(this.data);
}
