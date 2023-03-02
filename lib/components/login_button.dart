import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import 'error_snackbar.dart';

class LoginButton extends StatelessWidget {
  final LoginController loginController;
  final GlobalKey<FormState> formKey;
  const LoginButton(
      {super.key, required this.loginController, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      // Exibe o botão de login ou um Loader, de acordo com o valor de inLoader
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
                // Verificar se o CPF digitado é válido e, se sim, autenticar usuário
                if (formKey.currentState!.validate()) {
                  loginController.auth().then(
                    (result) {
                      // Verificar se usuário foi autenticado e, se sim, encaminhá-lo à HomePage, se não, mostrar mensagem de erro
                      if (result) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        String errormessage = 'Falha ao realizar login';
                        errorSnackBar(context, errormessage);
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
