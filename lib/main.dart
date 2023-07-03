import 'package:croix_rouge_storage_manager_mobile/firebase_options.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/authentication_repository/authentication_repository.dart';
import 'package:croix_rouge_storage_manager_mobile/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Croix Rouge Storage Manager',
      theme: TAPPTheme.lightTheme,
      darkTheme: TAPPTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}