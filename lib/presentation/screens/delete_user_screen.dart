import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../manager/api_cubit.dart';

class DeleteUserScreen extends StatelessWidget {
  const DeleteUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => sl<ApiCubit>()..emitSuccessDeletedUser(6958828),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Delete User',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<ApiCubit, ApiState>(
          builder: (context, state) {
            if (state is SuccessDeleteUser) {

              return Card(
                color: Colors.teal.shade50,
                child: const ListTile(
                  title: Text(
                    "Deleted Successfully",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Great Work",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
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
