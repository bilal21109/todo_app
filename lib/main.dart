import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/modules/app/pages/todo_app.dart';
import 'package:todo_app/modules/todo_list/repository/todo_repository.dart';
import 'core/injection/di.dart';
import 'core/storage_services/storage_service.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  await di.allReady();
  runApp(const TodoApp());
}

