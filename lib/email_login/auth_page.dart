import 'package:elaajapp/email_login/login_or_register.dart';
import 'package:elaajapp/home/main_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //is user logged in
          if (snapshot.hasData) {
            return const MainLayout(); //mainlayout
          }

          //is user not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
