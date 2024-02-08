  import 'package:flutter/material.dart';


void naviToForgot(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/forget_pass',);
  }


void naviToSignup(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/signup',);
  }

void naviToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login',);
  }

void naviToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/',);
  }


void naviToAddTask(BuildContext context) {
    Navigator.pushNamed(context, '/add_task',);
  }

