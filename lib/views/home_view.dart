import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart_task/models/cart.dart';
import 'package:pie_chart_task/provider/home_provider.dart';
import 'package:pie_chart_task/views/cart_dialog.dart';
import 'package:pie_chart_task/views/global_snack_bar.dart';
import 'package:provider/provider.dart';

import 'margirita_pie_chart.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          Provider<Cart>(create: (context) => Cart())
        ],
        builder: (context, child) {
          final home = context.read<HomeProvider>();
          final cart = context.read<Cart>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Margrita'),
              centerTitle: true,
            ),
            body: FutureBuilder(
                future: home.getDrinksMapForPieChart(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text(
                      'Error occured',
                      style: TextStyle(color: Colors.red),
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
            floatingActionButton: FloatingActionButton(
                onPressed: () => cartDialog(context, cart),
                child: const Text('check')),
          );
        });
  }
}
