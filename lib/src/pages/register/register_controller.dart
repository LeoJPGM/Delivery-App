import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/provider/users_provider.dart';
import 'package:delivery_app/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();

  BuildContext? context;

  UsersProvider usersProvider = UsersProvider();

  Future init(BuildContext context) async {
    this.context = context;
    usersProvider.init(context);
  }

  void goToLoginPage() {
    if (context != null) {
      Navigator.of(context!).pushNamed('login');
    } else {
      print("Context no está inicializado");
    }
  }

  void register(BuildContext context) async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confPassword = confPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastName.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      MySnackbar.show(context, 'Debes ingresar todos los campos');
      return;
    }

    if (confPassword != password) {
      MySnackbar.show(context, 'Las contraseñas no coinciden');
      return;
    }

    if (password.length <= 8) {
      MySnackbar.show(
          context, 'La contraseña debe tener al menos 8 caracteres');
      return;
    }

    User user = User(
        email: email,
        name: name,
        lastname: lastName,
        phone: phone,
        password: password);

    ResponseApi? responseApi = await usersProvider.create(user);

    if (context.mounted) {
      MySnackbar.show(
          context,
          responseApi!.message ??
              'Mensaje no disponible'); // Puedes personalizar el mensaje
    }
  }
}
