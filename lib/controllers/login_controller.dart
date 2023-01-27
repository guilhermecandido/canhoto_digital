import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  String? _cpf;
  setCPF(String value) => _cpf = value;

  Future<bool> auth() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_cpf == '094.618.699-59') {
      _storeCpf() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('cpf', _cpf!);
      }

      return true;
    }
    return false;
  }
}
