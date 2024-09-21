import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(top: -80, left: -100, child: _circleLogin()),
            Positioned(top: 60, left: 25, child: _textLogin()),
            Column(
              children: [
                _imageBanner(),
                _textFielEmail(),
                _textFieldPassword(),
                _buttonLogin(),
                _textDontHaveAccount()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
    );
  }

  Widget _textLogin() {
    return const Text(
      'LOGIN',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 100, bottom: MediaQuery.of(context).size.height * 0.22),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _textFielEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Correo electrónico",
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(Icons.email, color: MyColors.primaryColor)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Contraseña",
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(Icons.lock, color: MyColors.primaryColor)),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(vertical: 15)),
          child: const Text(
            "INGRESAR",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No tienes cuenta?",
          style: TextStyle(color: MyColors.primaryColor),
        ),
        const SizedBox(
          width: 7,
        ),
        Text("Registrate",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor,
            ))
      ],
    );
  }
}
