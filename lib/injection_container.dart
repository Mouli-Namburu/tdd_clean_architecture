import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'features/authentication/data/datasources/loginRemoteDataSource.dart';
import 'features/authentication/domain/repositories/login_repo.dart';
import 'features/authentication/domain/usecases/login_useCase.dart';
import 'features/authentication/presentation/controllers/login_controller.dart';
import 'features/authentication/presentation/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<http.Client>(
          create: (_) => http.Client(),
        ),
        Provider<LoginRemoteDataSource>(
          create: (context) => LoginRemoteDataSourceImpl(client: context.read<http.Client>()),
        ),
        Provider<LoginRepository>(
          create: (context) => LoginRepositoryImpl(remoteDataSource: context.read<LoginRemoteDataSource>()),
        ),
        Provider<LoginUseCase>(
          create: (context) => LoginUseCase(context.read<LoginRepository>()),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => LoginController(context.read<LoginUseCase>()),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Clean Architecture',
        home: LoginPage(),
      ),
    );
  }
}
