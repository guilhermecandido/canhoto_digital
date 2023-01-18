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
  String cpf = '';
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.all(50),
        child: TextFormField(
          inputFormatters: [
            MaskTextInputFormatter(
              mask: "###.###.###-##",
              filter: {"#": RegExp(r'[0-9]')},
            ),
          ],
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.only(top: 14),
            hintText: 'CPF',
            hintStyle: TextStyle(
              color: Colors.black26,
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xff198bb5),
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: (text) {
            cpf = text;
          },
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          backgroundColor: Color(0x660b4257),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () {
          validate(cpf);
        },
        child: const Text('Entrar'),
      ),
    ],
  );
}

void validate(String cpf) {}
