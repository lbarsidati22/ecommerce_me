import 'package:ecommerce_me/auth/auth_page/login_page.dart';
import 'package:ecommerce_me/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_me/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_me/layout/layout_screen.dart';
import 'package:ecommerce_me/screens/home_page.dart';
import 'package:ecommerce_me/screens/splach_page.dart';
import 'package:ecommerce_me/shared/cach_helper.dart';
import 'package:ecommerce_me/shared/constants.dart';
import 'package:ecommerce_me/shared/my_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CachHelper.cachInit();
  token = CachHelper.getFromData(key: 'token');
  print('your token is :$token');
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getBanners()
            ..getCategory()
            ..getPrudact(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: token != null && token != '' ? LayoutScreen() : LoginPage(),
      ),
    );
  }
}
