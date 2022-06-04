import 'package:flutter/material.dart';
import 'package:pie_chart_task/api/get_it.dart';
import 'package:pie_chart_task/views/home_view.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Margrita Pie Chart',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeView(),
    );
  }
}
