import 'package:api/presentation/manager/api_cubit.dart';
import 'package:api/presentation/screens/create_user_screen.dart';
import 'package:api/presentation/screens/delete_user_screen.dart';
import 'package:api/presentation/screens/getAllUser.dart';
import 'package:api/presentation/screens/get_user_by_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';

void main() {
  di();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: DeleteUserScreen(),
    );
  }
}


