import 'package:ecommerce_me/auth/auth_page/login_page.dart';
import 'package:ecommerce_me/shared/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              myTextFeild(
                controller: nameController,
                hintText: 'User',
                icon: Icons.person,
              ),
              SizedBox(
                height: 15,
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
              myTextFeild(
                controller: phoneController,
                hintText: 'Phone',
                icon: Icons.phone,
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
                  if (formKey.currentState!.validate()) {}
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
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Already have an account ?',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
