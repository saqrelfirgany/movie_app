import 'package:bnoud/repositories/home_repo.dart';
import 'package:bnoud/repositories/initial_repo.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  serviceLocator.registerLazySingleton<InitialRepository>(
    () => InitialRepository(),
  );
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepository(),
  );
}
