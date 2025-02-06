import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController({this.api = const HomeApi()});
  HomeApi api;

  List<Map<String, dynamic>> productCart = [];

  addProductsToCart(Map<String, dynamic> data) async {
    productCart.add(data);
    notifyListeners();
  }
}
