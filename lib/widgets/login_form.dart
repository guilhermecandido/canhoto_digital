import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../components/login_button.dart';
import '../controllers/login_controller.dart';
import 'custom_text_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final LoginController _controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(50),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextForm(
                  onChanged: _controller.setCPF,
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
                  hintText: 'CPF',
                  prefixicon: const Icon(
                    Icons.person,
                    color: Color(0x660b4257),
                  ),
                ),
                const SizedBox(height: 15),
                LoginButton(
                  formKey: formKey,
                  loginController: _controller,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
