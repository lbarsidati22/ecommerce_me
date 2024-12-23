import 'package:ecommerce_me/auth/auth_page/register_page.dart';
import 'package:ecommerce_me/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_me/auth/cubit/auth_state.dart';
import 'package:ecommerce_me/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<AuthCubit>(context);
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
                      if (fromKey.currentState!.validate()) {
                        cubit.login(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    child: state is LoginLeadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
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
                        'Don\'t have an account ?',
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
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
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
      },
    );
  }
}
