import 'package:exercise3/services/addsubject/add_service_rest.dart';
import 'package:exercise3/services/register_service/reg_service_rest.dart';
import 'package:get_it/get_it.dart';

import '../services/rest.dart';
import '../screens/user/user_viewmodel.dart';

import '../services/auth/auth_service.dart';
import '../services/counter/counter_service.dart';

import '../services/auth/auth_service_rest.dart';
import '../services/counter/counter_service_rest.dart';

 //import '../services/auth/auth_service_mock.dart';
 //import '../services/counter/counter_service_mock.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton<RestService>(
    //() => RestService(baseUrl: 'http://192.168.1.6:3000'),
    //() => RestService(baseUrl: 'http://192.168.1.6:5001/aidel-backend-firebase-rest/us-central1/api'),
    () => RestService(baseUrl: 'https://us-central1-aidel-backend-firebase-rest.cloudfunctions.net/api'),
  );

  dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());
  dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
   //dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
   //dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());
  dependency.registerLazySingleton(() => RegServiceRest());
  dependency.registerLazySingleton(() => AddServiceRest());
  // Viewmodels
  dependency.registerLazySingleton(() => UserViewmodel());
}
