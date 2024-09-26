import 'package:flutter/material.dart';

class MySnackbar {
  static void show(BuildContext context, String text) {
    // Verifica si el texto está vacío
    if (text.isEmpty) return;

    // Se asegura de que el foco se quite de cualquier campo de texto.
    FocusScope.of(context).unfocus();

    // Muestra el Snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
    ));
  }
}
