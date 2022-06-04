import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class MargritaPieChart extends StatelessWidget {
  const MargritaPieChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Expanded(
        flex: 1,
        child: PieChart(
          dataMap: provider.drinksPieChartMap!,
          chartRadius: 300.0,
          chartValuesOptions: const ChartValuesOptions(
              decimalPlaces: 0,
              showChartValueBackground: false,
              showChartValuesOutside: false),
          chartType: ChartType.disc,
          chartLegendSpacing: 20,
          colorList: provider.colorList,
          legendOptions: const LegendOptions(
              legendShape: BoxShape.rectangle,
              legendPosition: LegendPosition.bottom,
              legendTextStyle: TextStyle(fontSize: 16),
              showLegends: false),
        ),
      ),
    );
  }
}
