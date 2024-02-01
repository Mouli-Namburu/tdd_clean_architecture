import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_clean_architecture/features/authentication/data/models/login_model.dart';
import 'package:tdd_clean_architecture/features/authentication/domain/repositories/login_repo.dart';
import 'package:tdd_clean_architecture/features/authentication/domain/usecases/login_useCase.dart';



class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  late MockLoginRepository mockLoginRepository;
  late LoginUseCase useCase;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    useCase = LoginUseCase(mockLoginRepository);
  });

  final tUsername = 'test';
  final tPassword = '123456';

  test('should use the repository to execute login', () async {
    // Arrange
    when(mockLoginRepository.login("testUser", "testPassword"))
        .thenAnswer((_) async => LoginModel(success: true, message: 'Success', token: '123')); // Replace with a valid LoginModel

    // Act
    await useCase.execute(tUsername, tPassword);

    // Assert
    verify(mockLoginRepository.login(tUsername, tPassword));
  });
}
