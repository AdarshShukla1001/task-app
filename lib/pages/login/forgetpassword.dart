import 'package:fireapp/pages/login/utils.dart/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
            FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Your Password?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter your email address below to reset your password.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                 _auth
                        .sendPasswordResetEmail(
                            email: email.text.toString())
                        .then((value) {
                          Utils().errortoastMessage('Email has been send to your mail');
                      print('done');
                      Future.delayed(const Duration(milliseconds: 3000), () {
                          Navigator.pop(context);
                        });
                      setState(() {
                        // loading = false;
                      });
                    }).onError((error, stackTrace) {
                      
                      Utils().errortoastMessage(error.toString());
                    });
                // Add logic here to handle the forgot password functionality
                // For example, sending a password reset email
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
