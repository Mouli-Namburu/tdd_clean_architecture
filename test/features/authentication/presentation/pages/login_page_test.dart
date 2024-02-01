import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:tdd_clean_architecture/features/authentication/presentation/controllers/login_controller.dart';
import 'package:tdd_clean_architecture/features/authentication/presentation/pages/login_page.dart';

class MockLoginController extends Mock implements LoginController {}

void main() {
  late MockLoginController mockLoginController;

  setUp(() {
    mockLoginController = MockLoginController();
  });

  testWidgets('should display text fields and login button', (WidgetTester tester) async {
    // Arrange
    when(mockLoginController.loginUser("testUser", "testPassword")).thenAnswer((_) async => true);

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<LoginController>(
          create: (_) => mockLoginController,
          child: LoginPage(),
        ),
      ),
    );

    // Assert
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
