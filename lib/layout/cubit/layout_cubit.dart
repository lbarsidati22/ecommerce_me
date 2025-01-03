import 'dart:convert';

import 'package:ecommerce_me/layout/cubit/layout_state.dart';
import 'package:ecommerce_me/model/baner_model.dart';
import 'package:ecommerce_me/model/category_model.dart';
import 'package:ecommerce_me/model/prudact_model.dart';
import 'package:ecommerce_me/model/user_model.dart';
import 'package:ecommerce_me/screens/card_page.dart';
import 'package:ecommerce_me/screens/category_page.dart';
import 'package:ecommerce_me/screens/favorite_page.dart';
import 'package:ecommerce_me/screens/home_page.dart';
import 'package:ecommerce_me/screens/profile_page.dart';
import 'package:ecommerce_me/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
  List<BanerModel> banners = [];
  void getBanners() async {
    emit(GetBannersLeadingState());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/banners'),
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(BanerModel.fromJson(data: item));
      }
      emit(GetBannersSuccsessState());
    } else {
      emit(GetBannersFailedState());
    }
  }

  List<CategoryModel> categories = [];
  void getCategory() async {
    emit(GetCategoryLeadingState());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/categories'),
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(CategoryModel.fromJson(data: item));
      }

      emit(GetCategorySuccsessState());
    } else {
      emit(GetCategoryFailedState());
    }
  }

  List<PrudactModel> products = [];
  void getPrudact() async {
    emit(GetPrudactLeadingState());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/home'),
      headers: {
        'Authorization': token!,
        'lang': 'en',
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['products']) {
        products.add(PrudactModel.fromJson(data: item));
      }
      emit(GetPrudactSuccsessState());
    } else {
      emit(GetPrudactFailedState());
    }
  }

  List<PrudactModel> favorits = [];
  Set<String> favoritID = {};
  Future<void> getFavorite() async {
    favorits.clear();

    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/favorites'),
      headers: {
        'lang': 'en',
        'Authorization': token!,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      emit(GetFavoriteSuccsessState());
      for (var item in responseBody['data']['data']) {
        favorits.add(PrudactModel.fromJson(data: item['product']));
        favoritID.add(item['product']['id'].toString());
      }
      print('your favorite number is ${favorits.length}');
    } else {
      emit(GetFavoriteFailedState());
    }
  }

  void addOrRemoveFavorite({required String prudactId}) async {
    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/favorites'),
      headers: {
        'lanh': 'en',
        'Authorization': token!,
      },
      body: {
        'product_id': prudactId,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      if (favoritID.contains(prudactId)) {
        favoritID.remove(prudactId);
      } else {
        favoritID.add(prudactId);
      }
      await getFavorite();
      emit(AddOrRemoveFavoriteSuccsessState());
    } else {
      emit(AddOrRemoveFavoriteEroorState());
    }
  }

  late int priceTotal;
  Set<String> cartsID = {};
  List<PrudactModel> carts = [];
  Future<void> getCart() async {
    carts.clear();
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/carts'),
      headers: {
        'lang': 'en',
        'Authorization': token!,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      emit(GetCartsSuccsessState());
      for (var item in responseBody['data']['cart_items']) {
        cartsID.add(item['product']['id'].toString());
        carts.add(PrudactModel.fromJson(data: item['product']));
      }
      debugPrint('your carts is ${carts.length}');
      priceTotal = responseBody['data']['total'];
    } else {
      emit(GetCartsFailedState());
    }
  }

  void addOrRemoveCarts({required String prudactId}) async {
    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/carts'),
      headers: {
        'lang': 'en',
        'Authorization': token!,
      },
      body: {
        'product_id': prudactId,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      if (cartsID.contains(prudactId)) {
        cartsID.remove(prudactId);
      } else {
        cartsID.add(prudactId);
      }
      await getCart();
      emit(AddOrRemoveCartsSuccsessState());
    } else {
      emit(AddOrRemoveCartsEroorState());
    }
  }

  UserModel? userModel;
  void getProfile() async {
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/profile'),
      headers: {
        'lang': 'en',
        'Authorization': token!,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      userModel = UserModel.fromJson(data: responseBody['data']);
      emit(GetProfileSuccsesState());
      print('response is :$responseBody');
    } else {
      emit(GetProfileErrorState());
    }
  }
}
