// import 'package:app/auth_service.dart';

import 'package:fireapp/config/routes/routes.dart';
import 'package:fireapp/firebase_options.dart';
import 'package:fireapp/pages/home/addtask.dart';
import 'package:fireapp/pages/home/home.dart';
import 'package:fireapp/pages/home/addtask.dart';
import 'package:fireapp/pages/login/forgetpassword.dart';
import 'package:fireapp/pages/login/signup.dart';
import 'package:fireapp/pages/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    final auth = FirebaseAuth.instance;

bool _isLogin=false;
    final user =  auth.currentUser ;
    // final google = GoogleSignIn().isSignedIn();

    if(user!=null){
      _isLogin = true;
    }else {
      _isLogin = false;
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      onGenerateRoute: AppRoutes.onGenerateRoutes,
      // home: AddTaskPage()
      // home: LoginPage(),
      home: _isLogin ? TaskListPage()  : SignUpPage(),
      // ForgotPasswordPage(),
      // AddTaskScreen()
      // TaskListPage(),
    );
  }
}
