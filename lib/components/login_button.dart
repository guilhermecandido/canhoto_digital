import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controllers/login_controller.dart';
import '../pages/home_page.dart';

class LoginButton extends StatelessWidget {
  final LoginController loginController;
  final formKey;
  const LoginButton({super.key, required this.loginController, this.formKey});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? const CircularProgressIndicator(color: Colors.white)
          : ElevatedButton(
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
                  loginController.auth().then(
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Falha ao realizar login'),
                            duration: Duration(seconds: 5),
                            padding: EdgeInsets.all(20),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
                  );
                }
              },
              child: const Text('Entrar'),
            ),
    );
  }
}
