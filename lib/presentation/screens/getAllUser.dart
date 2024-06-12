import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../../core/exeptions/network_exeptions/network_exceptions.dart';
import '../../data/models/users.dart';
import '../manager/api_cubit.dart';
import '../manager/api_state.dart';

class GetAllUsersScreen extends StatelessWidget {
  GetAllUsersScreen({super.key});

  List<Users> usersList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ApiCubit>()..emitSuccessGetAllUsers(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'All Users',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<ApiCubit, ApiState<List<Users>>>(
          builder: (context, ApiState<List<Users>> state) {
           return state.when(
              initial: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              success: (usersList) {
                // usersList = (state).;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.teal.shade50,
                        child: ListTile(
                          title: Text(
                            usersList[index].name.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            usersList[index].email.toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              usersList[index].gender.toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    });
              },
              failure: (error) => Card(
                  color: Colors.teal.shade50,
                  child: ListTile(
                    title: Text(NetworkExceptions.getErrorMessage(error)),
                  )),
            );
          },
        ),
      ),
    );
  }
}
