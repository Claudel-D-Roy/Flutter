import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ggteammobile_tp/pages/Listecombat_page.dart';
import 'package:ggteammobile_tp/pages/creer_combat.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ggteammobile_tp/pages/Listecombat_page.dart';
import 'package:ggteammobile_tp/providers/utilisateur_provider.dart';

class MockUtilisateurProvider extends Mock implements UtilisateurProvider {}

void main() {
  group('ListCombatPage', () {
    testWidgets('should navigate to CreerCombatPage when logged in as admin', (WidgetTester tester) async {
      // Arrange
      final mockUtilisateurProvider = MockUtilisateurProvider();
      when(mockUtilisateurProvider.isLoggedIn).thenReturn(true);
      when(mockUtilisateurProvider.hasRole("admin")).thenReturn(true);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => mockUtilisateurProvider,
            child: ListCombatPage(),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Modifier'));

      // Assert
      await tester.pumpAndSettle();
      expect(find.byType(CreerCombatPage), findsOneWidget);
    });

    testWidgets('should not navigate to CreerCombatPage when not logged in or not admin', (WidgetTester tester) async {
      // Arrange
      final mockUtilisateurProvider = MockUtilisateurProvider();
      when(mockUtilisateurProvider.isLoggedIn).thenReturn(false);
      when(mockUtilisateurProvider.hasRole("admin")).thenReturn(false);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => mockUtilisateurProvider,
            child: ListCombatPage(),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Modifier'));

      // Assert
      await tester.pumpAndSettle();
      expect(find.byType(CreerCombatPage), findsNothing);
    });
  });
}