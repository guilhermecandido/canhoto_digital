import 'package:canhoto_digital_faxon_v2/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import '../components/background.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      LoginController.isAuth(),
      Future.delayed(const Duration(seconds: 3)),
    ]).then((value) => value[0]
        ? Navigator.of(context).pushReplacementNamed('/home')
        : Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        const Background(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            'lib/assets/images/logo.png',
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ],
    );
  }
}
