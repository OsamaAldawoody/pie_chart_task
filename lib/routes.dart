import 'package:flutter/material.dart';
import 'package:pie_chart_task/views/home/home_view.dart';

import 'views/cart/cart_view.dart';

class Routes {
  static const String initailRoute = '/';
  static const String homeRoute = 'home-route';
  static const String cartRoute = 'cart-route';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.initailRoute: (ctx) => const HomeView(),
    Routes.homeRoute: (ctx) => const HomeView(),
    Routes.cartRoute: (ctx) => const CartView(),
  };
}
