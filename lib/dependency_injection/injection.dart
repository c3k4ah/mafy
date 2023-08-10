//getIt injection

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../features/get_principal_info/data/datasources/local/api_local_data_impl.dart';
import 'dependency_injection.dart';

void initInjection() {
  final getIt = GetIt.instance;
  blocs(getIt);
  datasources(getIt);
  repositories(getIt);
  usecases(getIt);
  externalResources(getIt);
}

void blocs(GetIt getIt) {
  getIt.registerFactory(
    () => PrincipalInfoBloc(
      cacheLastCitation: getIt<CacheLastCitationUsecase>(),
      getLocalCitation: getIt<GetLocalCitationUsecase>(),
      getRemoteCitation: getIt<GetRemoteCitationUsecase>(),
    ),
  );
}

void datasources(GetIt getIt) {
  getIt.registerLazySingleton<ApiLocalDataSource>(
    () => ApiLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<ApiRemoteDataSource>(
    () => ApiRemoteDataSourceImpl(
      client: getIt<http.Client>(),
    ),
  );
}

void repositories(GetIt getIt) {
  getIt.registerLazySingleton<ApiRepo>(
    () => ApiRepoImpl(
      localDataSource: getIt<ApiLocalDataSource>(),
      remoteDataSource: getIt<ApiRemoteDataSource>(),
    ),
  );
}

void usecases(GetIt getIt) {
  getIt.registerLazySingleton<GetRemoteCitationUsecase>(
    () => GetRemoteCitationUsecase(
      apiRepo: getIt<ApiRepo>(),
    ),
  );
  getIt.registerLazySingleton<GetLocalCitationUsecase>(
    () => GetLocalCitationUsecase(
      apiRepo: getIt<ApiRepo>(),
    ),
  );
  getIt.registerLazySingleton<CacheLastCitationUsecase>(
    () => CacheLastCitationUsecase(
      apiRepo: getIt<ApiRepo>(),
    ),
  );
}

void service(GetIt getIt) {}

void externalResources(GetIt getIt) {
  getIt.registerSingleton<http.Client>(http.Client());
}
