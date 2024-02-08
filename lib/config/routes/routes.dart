import 'package:fireapp/pages/home/home.dart';
import 'package:fireapp/pages/home/addtask.dart';
import 'package:fireapp/pages/login/forgetpassword.dart';
import 'package:fireapp/pages/login/login.dart';
import 'package:fireapp/pages/login/signup.dart';
import 'package:fireapp/pages/home/addtask.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(TaskListPage());

      case '/add_task':
        return _materialRoute(AddTaskPage());

      case '/login':
        return _materialRoute( LoginPage());

      case '/signup':
        return _materialRoute(SignUpPage());

      case '/forget_pass':
        return _materialRoute(ForgotPasswordPage());
        
      default:
        return _materialRoute( SignUpPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
