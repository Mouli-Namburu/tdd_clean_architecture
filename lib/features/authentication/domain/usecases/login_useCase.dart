import '../../data/models/login_model.dart';
import '../repositories/login_repo.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<bool> execute(String username, String password) async {
    try {
      LoginModel loginResult = await repository.login(username, password);

      return loginResult.success;
    } catch (e) {
      print('Login failed: ${e.toString()}');
      return false;
    }
  }
}
