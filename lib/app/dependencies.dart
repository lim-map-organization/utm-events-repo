import 'package:get_it/get_it.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';
import 'package:map_project/screens/EventList/eventlist_viewmodel.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/services/appointment/app_service.dart';
import 'package:map_project/services/appointment/app_service_rest.dart';
import 'package:map_project/services/auth/auth_service.dart';
import 'package:map_project/services/auth/auth_service_rest.dart';
import 'package:map_project/services/event/event_service.dart';
import 'package:map_project/services/event/event_service_rest.dart';
import 'package:map_project/services/news/new_service.dart';
import 'package:map_project/services/news/new_service_mock.dart';
import 'package:map_project/services/rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  //Services (connect to backend)
  dependency.registerLazySingleton<RestService>(
    () => RestService(baseUrl: 'https://us-central1-delta-athlete-253904.cloudfunctions.net/api'),
  );
  dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  dependency.registerLazySingleton<AppService>(() => AppServiceRest());
  dependency.registerLazySingleton<EventService>(() => EventServiceRest());
  dependency.registerLazySingleton<NewsService>(() => NewsServiceMock());

  //View models
  dependency.registerLazySingleton<UserViewmodel>(() => UserViewmodel());
  dependency.registerLazySingleton<AppListViewmodel>(() => AppListViewmodel());
  dependency.registerLazySingleton<EventListViewmodel>(() => EventListViewmodel());
}