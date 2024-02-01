import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String username, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;
  final String apiUrl = 'https://json-placeholder.mock.beeceptor.com/login';

  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> login(String username, String password) async {
    final response = await client.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
