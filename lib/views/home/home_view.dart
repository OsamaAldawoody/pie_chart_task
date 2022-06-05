import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart_task/models/cart.dart';
import 'package:pie_chart_task/provider/home_provider.dart';
import 'package:pie_chart_task/routes.dart';
import 'package:pie_chart_task/views/global_snack_bar.dart';
import 'package:provider/provider.dart';

import 'margirita_pie_chart.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, child) {
          final home = context.read<HomeProvider>();
          final cart = context.read<Cart>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Margrita'),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.cartRoute),
                  icon: const Icon(Icons.shopping_cart)),
            ),
            body: FutureBuilder(
                future: home.getDrinksMapForPieChart(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Error occured',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      home.drinksPieChartMap!.isNotEmpty) {
                    return Column(
                      children: [
                        const MargritaPieChart(),
                        Expanded(
                          flex: 1,
                          child: ListView(
                            children: home.drinksList
                                .map((drink) => InkWell(
                                      onTap: () {
                                        cart.addDrink(drink.drinkName);
                                        GlobalSnackBar.buildSnackbar(context,
                                            '${drink.drinkName} added to the cart');
                                      },
                                      child: Card(
                                        color: drink.color,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            drink.drinkName,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.pink));
                  }
                }),
          );
        });
  }
}
