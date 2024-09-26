import 'package:delivery_app/src/pages/login/login_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(top: -80, left: -100, child: _circleLogin()),
            Positioned(top: 60, left: 25, child: _textLogin()),
            SingleChildScrollView(
              child: Column(
                children: [
                  _lottieAnimation(),
                  _textFielEmail(),
                  _textFieldPassword(),
                  _buttonLogin(),
                  _textDontHaveAccount()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
          top: 150, bottom: MediaQuery.of(context).size.height * 0.15),
      child: Lottie.asset('assets/json/delivery.json',
          width: 350, height: 200, fit: BoxFit.fill),
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
          color: Colors.white,
          fontFamily: 'NimbusSans',
          fontWeight: FontWeight.bold,
          fontSize: 22),
    );
  }

  Widget _textFielEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _controller.emailController,
        keyboardType: TextInputType.emailAddress,
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
        controller: _controller.passwordController,
        obscureText: true,
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
          onPressed: () => _controller.login(context),
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
        GestureDetector(
          onTap: _controller.goToRegisterPage,
          child: Text("Registrate",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor,
              )),
        )
      ],
    );
  }
}
