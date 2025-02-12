import 'package:ecommerce_front/repositories/login_repository.dart';

class LoginService {
  final LoginRepository _repository = LoginRepository();

  Future<bool> authenticate(String username, String password) async {
    return await _repository.login(username, password);
  }
}
