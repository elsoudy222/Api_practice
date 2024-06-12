// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../core/di/injection.dart';
// import '../../data/models/users.dart';
// import '../manager/api_cubit.dart';
//
// class GetUserByIDScreen extends StatelessWidget {
//   GetUserByIDScreen({super.key});
//
//   Users user = Users();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<ApiCubit>()..emitSuccessGetUserById(6958111),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           title: const Text(
//             'Get User By ID',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: BlocBuilder<ApiCubit, ApiState>(
//           builder: (context, state) {
//             if (state is SuccessGetUserById) {
//               user = (state).userDetails;
//               return Card(
//                 color: Colors.teal.shade50,
//                 child: ListTile(
//                   title: Text(
//                     user.name.toString(),
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     user.email.toString(),
//                     style: const TextStyle(
//                         fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   leading: Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Text(
//                       user.gender.toString(),
//                       style: const TextStyle(
//                           fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator.adaptive(),
//               );
//             }
//           },
//         ),
//
//       ),
//     );
//   }
// }
