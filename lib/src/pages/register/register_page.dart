import 'package:delivery_app/src/pages/register/register_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _controller = RegisterController();

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
          Positioned(
            top: -80,
            left: -100,
            child: _circleRegister(),
          ),
          Positioned(top: 54, left: -10, child: _iconBack()),
          Positioned(top: 65, left: 25, child: _textRegister()),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 150),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _imageUserProfile(),
                  const SizedBox(
                    height: 30,
                  ),
                  _textFielEmail(),
                  _textFielName(),
                  _textFielLastName(),
                  _textFielPhone(),
                  _textFielPassword(),
                  _textFielConfPassword(),
                  _buttonRegister()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget _circleRegister() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
    );
  }

  Widget _iconBack() {
    return IconButton(
        onPressed: _controller.goToLoginPage,
        color: Colors.white,
        icon: const Icon(Icons.arrow_back_ios));
  }

  Widget _textRegister() {
    return const Text(
      "REGISTRO",
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'NimbusSans',
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }

  Widget _imageUserProfile() {
    return CircleAvatar(
      backgroundImage: const AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
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

  Widget _textFielName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _controller.nameController,
        decoration: InputDecoration(
            hintText: "Nombre",
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(Icons.person, color: MyColors.primaryColor)),
      ),
    );
  }

  Widget _textFielLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _controller.lastNameController,
        decoration: InputDecoration(
            hintText: "Apellido",
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon:
                Icon(Icons.person_outline, color: MyColors.primaryColor)),
      ),
    );
  }

  Widget _textFielPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _controller.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: "Teléfono",
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(Icons.phone, color: MyColors.primaryColor)),
      ),
    );
  }

  Widget _textFielPassword() {
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

  Widget _textFielConfPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _controller.confPasswordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Confirmar contraseña",
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(Icons.lock_outline, color: MyColors.primaryColor)),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
          onPressed: () => _controller.register(context),
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(vertical: 15)),
          child: const Text(
            "REGISTRAR",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
