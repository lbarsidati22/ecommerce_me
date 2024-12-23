import 'package:ecommerce_me/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              myTextFeild(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.mail,
              ),
              SizedBox(
                height: 15,
              ),
              myTextFeild(
                controller: passwordController,
                hintText: 'Password',
                icon: Icons.lock,
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minWidth: double.infinity,
                color: Colors.black,
                onPressed: () {
                  if (fromKey.currentState!.validate()) {}
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
