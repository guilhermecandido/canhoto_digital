import 'package:canhoto_digital_faxon_v2/widgets/login_form.dart';
import 'package:flutter/material.dart';
import '../components/background.dart';
import '../components/login_header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          const Background(),
          Column(
            children: const <Widget>[
              LoginHeader(),
              LoginForm(),
            ],
          ),
        ],
      ),
    );
  }
}
