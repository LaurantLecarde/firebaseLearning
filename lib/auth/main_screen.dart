import 'package:firebase/auth/auth_screen.dart';
import 'package:firebase/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<MainScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData) {
            return HomePage();
          }else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
