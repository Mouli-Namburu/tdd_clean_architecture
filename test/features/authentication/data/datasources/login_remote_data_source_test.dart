import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_clean_architecture/features/authentication/data/datasources/loginRemoteDataSource.dart';


class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late LoginRemoteDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = LoginRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('login', () {
    final tUsername = 'test';
    final tPassword = '123456';

    test('should perform a POST request to login', () async {
      // Arrange
      when(mockHttpClient.post(Uri.parse(''), headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('{"success": true}', 200));

      // Act
      dataSource.login(tUsername, tPassword);

      // Assert
      verify(mockHttpClient.post(
        Uri.parse('YOUR_API_ENDPOINT'), // Replace with your API endpoint
        headers: {'Content-Type': 'application/json'},
        body: anyNamed('body'),
      ));
    });
  });
}
