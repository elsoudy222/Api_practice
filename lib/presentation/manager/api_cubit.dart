

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exeptions/network_exeptions/network_exceptions.dart';
import '../../data/models/users.dart';
import '../../data/repos/api_repo.dart';
import 'api_state.dart';



class ApiCubit extends Cubit<ApiState<List<Users>>> {
  final ApiRepo apiRepo;

  ApiCubit(this.apiRepo) : super(const ApiState.initial());

  // void emitSuccessGetAllUsers() {
  //   apiRepo.getAllUsers().then((usersList) {
  //     emit(SuccessGetAllUsers(usersList));
  //     log("================ SUCCESS =================");
  //   }).catchError((e) {
  //     log("================ ERROR =================");
  //   });
  // }

  // void emitSuccessGetUserById(int userId) {
  //   apiRepo.getUserById(userId).then((userDetails) {
  //     emit(SuccessGetUserById(userDetails));
  //     log("================ SUCCESS =================");
  //   }).catchError((e) {
  //     log("================ ERROR =================");
  //   });
  // }
  void emitSuccessGetAllUsers() async {
    var usersList = await apiRepo.getAllUsers();
    usersList.when(
        success: (List<Users> users) {
      emit(ApiState.success(users));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ApiState.failure(networkExceptions));
    });
  }
  void emitSuccessCreateNewUser(List<Users> newUser) async {
    var result = await apiRepo.createNewUser(newUser as Users);
    result.when(success: (Users userData) {
      emit(ApiState.success(userData as List<Users>));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ApiState.failure(networkExceptions));
    });
  }

  // void emitSuccessCreateNewUser(Users newUser) {
  //   apiRepo.createNewUser(newUser)
  //       .then((newUser) {
  //     emit(SuccessCreateNewUser(newUser));
  //     log("================ SUCCESS =================");
  //   }).catchError((e) {
  //     log("================ ERROR =================");
  //   });
  // }

  // void emitSuccessDeletedUser(int id) {
  //   apiRepo.deleteUserById(id)
  //       .then((data) {
  //     emit(SuccessDeleteUser(data));
  //     log("================ SUCCESS =================");
  //   }).catchError((e) {
  //     log("================ ERROR =================");
  //   });
  // }
}
