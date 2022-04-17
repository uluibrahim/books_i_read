import 'package:books_i_read/screen/home/service/home_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();
void get setupLocator {
  locator.registerLazySingleton(() => HomeService());
}
