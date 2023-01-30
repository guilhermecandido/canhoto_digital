import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _cpf;
  setCPF(String value) => _cpf = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_cpf == '094.618.699-59') {
      _storeCpf() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('cpf', _cpf!);
      }

      inLoader.value = false;
      return true;
    } else
      inLoader.value = false;
    return false;
  }
}
