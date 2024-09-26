import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/provider/users_provider.dart';
import 'package:delivery_app/src/utils/my_snackbar.dart';
import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  final SharedPref _sharedPref = SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    if (user.sessionToken != null && context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
    }
  }

  void goToRegisterPage() {
    if (context != null) {
      Navigator.of(context!).pushNamed('register');
    } else {
      // Manejar el caso cuando context es null
      print("Context no está inicializado");
    }
  }

  void login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi? responseApi = await usersProvider.login(email, password);

    if (responseApi?.success == true && context.mounted) {
      User user = User.fromJson(responseApi?.data);
      _sharedPref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
    } else if (context.mounted) {
      MySnackbar.show(context, responseApi!.message ?? 'Mensaje no disponible');
    }
  }
}
