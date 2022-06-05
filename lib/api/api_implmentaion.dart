import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart_task/api/_api.dart';
import 'package:pie_chart_task/models/drink.dart';

class DrinkImplementation implements DrinkAbstract {
  var dio = Dio(BaseOptions(
    baseUrl: 'https://www.thecocktaildb.com/api',
  ));
  @override
  Future<List<Drink>> getDrinks() async {
    List<Drink> drinks = [];
    try {
      final response = await dio.get('/json/v1/1/search.php?s=margarita');
      drinks = Drink.drinksFromJson(response.data['drinks']);
      return drinks;
    } on SocketException {
      throw 'Connection error';
    } catch (e, s) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
