import 'package:flutter/material.dart';
import 'package:pie_chart_task/api/get_it.dart';
import 'package:pie_chart_task/models/cart.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import 'views/home/home_view.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Margrita Pie Chart',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        routes: Routes.routes,
        initialRoute: Routes.initailRoute,
      ),
    );
  }
}
