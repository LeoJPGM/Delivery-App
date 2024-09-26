import 'package:delivery_app/src/pages/client/products/list/client_products_list_page.dart';
import 'package:delivery_app/src/pages/login/login_page.dart';
import 'package:delivery_app/src/pages/register/register_page.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Delivery App Flutter",
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'client/products/list': (context) => const ClientProductsListPage()
      },
      theme: ThemeData(primaryColor: MyColors.primaryColor),
    );
  }
}
