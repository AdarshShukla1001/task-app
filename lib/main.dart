// import 'package:app/auth_service.dart';

import 'package:fireapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fireapp/injection_container.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      // onGenerateRoute: AppRoutes.onGenerateRoutes,
      // home: AddTaskPage()
      // home: LoginPage(),
      home: Container()
      // ForgotPasswordPage(),
      // AddTaskScreen()
      // TaskListPage(),
    );
  }
}
