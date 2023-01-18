import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'components/background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          const Background(),
          Column(
            children: [
              loginHeader(),
              loginForm(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget loginHeader() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          'lib/assets/images/logo.png',
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      const Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget loginForm() {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          inputFormatters: [
            MaskTextInputFormatter(
              mask: "###.###.###-##",
              filter: {"#": RegExp(r'[0-9]')},
            ),
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xff198bb5),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    ],
  );
}
