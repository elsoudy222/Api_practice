import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../../data/models/users.dart';
import '../manager/api_cubit.dart';

class CreateUserScreen extends StatelessWidget {
  CreateUserScreen({super.key});

  Users user = Users(
      name: "Said Elsoudy",
      email: "said_soudy@gmail.com",
      gender: "Male",
      status: "Active");


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ApiCubit>()..emitSuccessCreateNewUser(user),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Create User',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<ApiCubit, ApiState>(
          builder: (context, state) {
            if (state is SuccessCreateNewUser) {
              user = (state).newUser;
              return Card(
                color: Colors.teal.shade50,
                child: ListTile(
                  title: Text(
                    user.name.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    user.email.toString(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      user.id.toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),

      ),
    );
  }
}
