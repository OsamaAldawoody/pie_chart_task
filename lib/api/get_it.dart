import 'package:get_it/get_it.dart';
import 'package:pie_chart_task/api/_api.dart';
import 'package:pie_chart_task/api/api_implmentaion.dart';
import 'package:pie_chart_task/provider/cart_provider.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<DrinkAbstract>(() => DrinkImplementation());
}
