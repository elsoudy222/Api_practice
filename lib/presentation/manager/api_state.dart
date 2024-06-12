// part of 'api_cubit.dart';
//
// @immutable
// sealed class ApiState {}
//
// class ApiInitial extends ApiState {}
//
// class SuccessGetAllUsers extends ApiState {
//
//   final List<Users> users;
//   SuccessGetAllUsers(this.users);
// }
//
// class SuccessGetUserById extends ApiState {
//
//   final Users userDetails;
//   SuccessGetUserById(this.userDetails);
// }
// class SuccessCreateNewUser extends ApiState {
//
//   final Users newUser;
//   SuccessCreateNewUser(this.newUser);
// }
// class SuccessDeleteUser extends ApiState {
//   final dynamic data;
//   SuccessDeleteUser(this.data);
// }

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/exeptions/network_exeptions/network_exceptions.dart';

part 'api_state.freezed.dart';

@freezed
class ApiState<T> with _$ApiState<T>{
 const factory ApiState.initial() = Initial<T>;
 const factory ApiState.loading() = Loading<T>;
 const factory ApiState.success(T data) = Success<T>;
 const factory ApiState.failure(NetworkExceptions networkExceptions) = Failure<T>;
}
