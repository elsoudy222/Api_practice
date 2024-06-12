// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../core/di/injection.dart';
// import '../../core/exeptions/network_exeptions/network_exceptions.dart';
// import '../../data/models/users.dart';
// import '../manager/api_cubit.dart';
// import '../manager/api_state.dart';
//
// class CreateUserScreen extends StatelessWidget {
//   CreateUserScreen({super.key});
//
//   Users user = Users(
//       name: "Zayn Elsoudy",
//       email: "zayn_soudyy@gmail.com",
//       gender: "Male",
//       status: "Active");
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<ApiCubit>()..emitSuccessCreateNewUser(user),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           title: const Text(
//             'Create User',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: BlocBuilder<ApiCubit, ApiState<Users>>(
//           builder: (context, ApiState<Users> state) {
//             return state.when(
//               initial: () => const Center(
//                 child: Text("INITIAL STATE"),
//               ),
//               loading: () => const Center(
//                 child: CircularProgressIndicator.adaptive(),
//               ),
//               success: (usersList) => Card(
//                 color: Colors.teal.shade50,
//                 child: ListTile(
//                   title: Text(
//                     usersList.name.toString(),
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     usersList.email.toString(),
//                     style: const TextStyle(
//                         fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   leading: Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Text(
//                       usersList.gender.toString(),
//                       style: const TextStyle(
//                           fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//               failure: (error) => Card(
//                   color: Colors.teal.shade50,
//                   child: ListTile(
//
//                     title: Text(NetworkExceptions.getErrorMessage(error)),
//                   )),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
