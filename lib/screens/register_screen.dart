import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterScreen({super.key, required this.showLoginPage});

  @override
  State<RegisterScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future signUp() async {
    if (_passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  bool _passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade200),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, labelText: "Email"),
                ),
              ),
              const Gap(25),
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade200),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, labelText: "   Password"),
                ),
              ),
              const Gap(25),
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade200),
                child: TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, labelText: " Confirm Password"),
                ),
              ),
              const Gap(25),
              InkWell(
                onTap: signUp,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: const Center(
                    child: Text("SIGN Up"),
                  ),
                ),
              ),
              const Gap(25),
              InkWell(
                onTap: widget.showLoginPage,
                child: const Text(
                  "Have an account ",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
