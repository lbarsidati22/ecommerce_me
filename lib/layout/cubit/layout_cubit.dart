import 'package:ecommerce_me/layout/cubit/layout_state.dart';
import 'package:ecommerce_me/screens/card_page.dart';
import 'package:ecommerce_me/screens/category_page.dart';
import 'package:ecommerce_me/screens/favorite_page.dart';
import 'package:ecommerce_me/screens/home_page.dart';
import 'package:ecommerce_me/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  int currentIndex = 0;
  void changNavBar(int index) {
    currentIndex = index;
    emit(NavBarlState());
  }

  List<Widget> screens = [
    HomePage(),
    CategoryPage(),
    FavoritePage(),
    CardPage(),
    ProfilePage(),
  ];
}
