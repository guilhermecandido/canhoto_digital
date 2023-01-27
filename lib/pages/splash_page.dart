import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/background.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    final prefs = SharedPreferences.getInstance();
    super.initState();
    // Future.wait([prefs]).then((value) => value[0]
    //     ? (_) => Navigator.of(context).pushReplacementNamed('/home')
    //     : (_) => Navigator.of(context).pushReplacementNamed('/login'));
    //Consulta inicial
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Navigator.of(context).pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Background(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'lib/assets/images/logo.png',
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
