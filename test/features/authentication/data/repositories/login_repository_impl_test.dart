import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_clean_architecture/features/authentication/data/datasources/loginRemoteDataSource.dart';
import 'package:tdd_clean_architecture/features/authentication/data/models/login_model.dart';
import 'package:tdd_clean_architecture/features/authentication/domain/repositories/login_repo.dart';

class MockLoginRemoteDataSource extends Mock implements LoginRemoteDataSource {}

void main() {
  late MockLoginRemoteDataSource mockRemoteDataSource;
  late LoginRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockLoginRemoteDataSource();
    repository = LoginRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('login', () {
    final tUsername = 'test';
    final tPassword = '123456';

    test('should call remote data source to login', () async {
      // Arrange
      when(mockRemoteDataSource.login("testUser", "testPassword"))
          .thenAnswer((_) async => LoginModel(success: true, message: 'Success', token: '123'));

      // Act
      repository.login(tUsername, tPassword);

      // Assert
      verify(mockRemoteDataSource.login(tUsername, tPassword));
    });
  });
}
