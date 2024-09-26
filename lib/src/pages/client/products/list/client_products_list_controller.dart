import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class ClientProductsListController {
  BuildContext? context;

  final SharedPref _sharedPref = SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
  }

  logout() {
    if (context != null) {
      _sharedPref.logout(context!);
    } else {
      print("El contexto es nulo, no se puede realizar el logout.");
    }
  }
}
