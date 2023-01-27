import 'package:canhoto_digital_faxon_v2/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/background.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  LoginController _controller = LoginController();
  String user = '';

  // FUNÇÃO SUBSTITUÍDA PELO login_controller
  // _logIn(String user) async {}
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   if (user == '094.618.699-59') {
  //     _storeCpf() async {
  //       final prefs = await SharedPreferences.getInstance();
  //       prefs.setString('cpf', user);
  //     }

  //     print('Logou!');
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomePage(),
  //       ),
  //     );
  //   } else {
  //     print('CPF inválido!');
  //   }
  // }

  _loginHeader() {
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

  _loginForm() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(50),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
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
                      color: Color(0x660b4257),
                    ),
                  ),
                  // controller: loginValidator,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 14) {
                      return 'Digite seu CPF';
                    }
                    return null;
                  },
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: "###.###.###-##",
                      filter: {"#": RegExp(r'[0-9]')},
                    ),
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: _controller.setCPF,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    backgroundColor: const Color(0x660b4257),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _controller.auth().then(
                        (result) {
                          if (result) {
                            print('Logou!');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          } else {
                            print('CPF inválido!');
                          }
                        },
                      );
                    }
                  },
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          const Background(),
          Column(
            children: [
              _loginHeader(),
              _loginForm(),
            ],
          ),
        ],
      ),
    );
  }
}
