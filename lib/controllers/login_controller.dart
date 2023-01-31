import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  static String? _cpf;
  // Atribuir à _cpf o valor do formulário de login sempre que modificado
  setCPF(String value) => _cpf = value;

  Future<bool> auth() async {
    // Autenticar usuário e armazenar com SharedPreferences
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Autenticar
    if (_cpf == '094.618.699-59') {
      // Armazenar
      prefs.setString('cpf', _cpf!);
      inLoader.value = false;
      return true;
    } else {
      inLoader.value = false;
      return false;
    }
  }

  static Future<bool> isAuth() async {
    // Verificar se há um usuário autenticado
    var prefs = await SharedPreferences.getInstance();
    // Atribuir à authuser o valor armazenado pelo SharedPreferences com a key 'cpf'
    var authuser = prefs.getString('cpf');
    if (authuser != null) {
      return true;
    }
    return false;
  }
}
