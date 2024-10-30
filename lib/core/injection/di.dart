
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/todo_list/repository/todo_repository.dart';
import '../storage_services/storage_service.dart';

final di = GetIt.instance;

Future setupLocator()async {
  di.registerSingletonAsync<SharedPreferences>(
          () async => SharedPreferences.getInstance());

  di.registerSingletonWithDependencies<StorageService>(
        () => StorageService(preferences: di()),
    dependsOn: [SharedPreferences],
  );
  di.registerLazySingleton(() => FirebaseFirestore.instance);
  di.registerLazySingleton(() => FirebaseAuth.instance);
  di.registerLazySingleton(() => TodoRepository(firebaseFirestore: di()));
}
