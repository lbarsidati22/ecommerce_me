import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_me/auth/cubit/auth_state.dart';
import 'package:ecommerce_me/shared/cach_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLeadingState());
    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      CachHelper.setToData(
        key: 'token',
        value: responseBody['data']['token'],
      );
      print(responseBody['data']);
      emit(LoginSuccessState());
    } else {
      emit(
        LoginFailedState(
          error: responseBody['message'],
        ),
      );
    }
  }
}
