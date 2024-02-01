import '../../data/datasources/loginRemoteDataSource.dart';
import '../../data/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> login(String username, String password);
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<LoginModel> login(String username, String password) async {
    try {
      final loginResult = await remoteDataSource.login(username, password);
      return loginResult;
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }
}
