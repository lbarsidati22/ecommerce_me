import 'package:bloc/bloc.dart';
import 'package:ecommerce_me/auth/cubit/auth_state.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void login({
    required String email,
    required String password,
  }) async {
    Response response = await http
        .post(Uri.parse('https://student.valuxapps.com/api/login'), body: {
      'email': email,
      'password': password,
    });
  }
}
