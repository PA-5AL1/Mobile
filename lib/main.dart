import 'dart:async';

import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/login/login_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/authentication_repository/authentication_repository.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Future.delayed(
      Duration(seconds: 2),
      () => Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform));

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Croix Rouge Storage Manager',
      theme: TAPPTheme.lightTheme,
      darkTheme: TAPPTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Get.lazyPut(() => AuthenticationRepository());
            return const LoginScreen();
          }
          return SplashScreen();
        },
      ),
    );
  }
}
