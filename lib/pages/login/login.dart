import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    bool _isLogin = false;
    final user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                // Perform login logic here
                String email = _emailController.text;
                String password = _passwordController.text;
                await _auth
                    .signInWithEmailAndPassword(
                  email: 'ada@ada.com',
                  password: 'password@ada.com',
                )
                    .then(
                  (value) async {
                    print('done');
                    setState(() {
                      // loading = false;
                    });

                    // You can add your login logic here (e.g., validate email and password)
                    print('Email: $email');
                    print('Password: $password');
                  },
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
