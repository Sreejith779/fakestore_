import 'package:fakestore/app/routes/app_routes.dart';
import 'package:fakestore/app/views/cartPage/ui/cartPage.dart';
import 'package:fakestore/app/views/homePage/ui/homePage.dart';
import 'package:fakestore/app/views/registerPage/registerPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/loginPage/ui/login_page.dart';

class AppPages{
  static final List<GetPage>pages=[
GetPage(name: AppRoutes.loginPage,
    page: ()=>LoginPage()),
GetPage(name: AppRoutes.registerPage,
    page: ()=>Registerpage()),
GetPage(name: AppRoutes.homePage,
    page: ()=>Homepage()),
GetPage(name: AppRoutes.cartPage,
    page: ()=>Cartpage()),
  ];

}