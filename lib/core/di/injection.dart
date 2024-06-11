import 'package:api/data/repos/api_repo.dart';
import 'package:api/data/web_services/web_services.dart';
import 'package:api/presentation/manager/api_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void di() {
  sl.registerLazySingleton<ApiCubit>(() => ApiCubit(sl()));
  sl.registerLazySingleton<ApiRepo>(() => ApiRepo(sl()));
  sl.registerLazySingleton<WebServices>(() => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  // dio
  //   ..options.connectTimeout = 200 * 1000
  //   ..options.receiveTimeout = (200 * 1000) as Duration?;
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));
  return dio;
}
