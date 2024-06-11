import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/users.dart';
import '../../data/repos/api_repo.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  final ApiRepo apiRepo;

  ApiCubit(this.apiRepo) : super(ApiInitial());

  void emitSuccessGetAllUsers() {
    apiRepo.getAllUsers().then((usersList) {
      emit(SuccessGetAllUsers(usersList));
      log("================ SUCCESS =================");
    }).catchError((e) {
      log("================ ERROR =================");
    });
  }

  void emitSuccessGetUserById(int userId) {
    apiRepo.getUserById(userId).then((userDetails) {
      emit(SuccessGetUserById(userDetails));
      log("================ SUCCESS =================");
    }).catchError((e) {
      log("================ ERROR =================");
    });
  }

  void emitSuccessCreateNewUser(Users newUser) {
    apiRepo.createNewUser(newUser)
        .then((newUser) {
      emit(SuccessCreateNewUser(newUser));
      log("================ SUCCESS =================");
    }).catchError((e) {
      log("================ ERROR =================");
    });
  }
  void emitSuccessDeletedUser(int id) {
    apiRepo.deleteUserById(id)
        .then((data) {
      emit(SuccessDeleteUser(data));
      log("================ SUCCESS =================");
    }).catchError((e) {
      log("================ ERROR =================");
    });
  }
}
