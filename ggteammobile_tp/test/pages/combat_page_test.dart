import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ggteammobile_tp/Controllers/utilisateur_controleur.dart';
import 'package:ggteammobile_tp/models/role.dart';
import 'package:ggteammobile_tp/models/utilisateur.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ggteammobile_tp/pages/combat_page.dart';
import 'package:ggteammobile_tp/providers/utilisateur_provider.dart';
import 'combat_page_test.mocks.dart';
import 'listecombat_page_test.dart';

@GenerateMocks([Auth0, WebAuthentication, UtilisateurControleur, Auth0Web])

void main() {
  group('CombatPage', () {
    testWidgets('Si nous ne sommes pas Admin, nous avons un message erreur dans le body de la page combat', (WidgetTester tester) async {

      // Arrange
      final auto0web = MockAuth0Web();
      final auth0 = MockAuth0();
      final webAuthentication = MockWebAuthentication();
      final utilisateurControleur = MockUtilisateurControleur();

      when(auth0.webAuthentication(scheme: "com.auth0.sample"))
        .thenReturn(webAuthentication);

      when(webAuthentication.login())
        .thenAnswer((_) async => Credentials(
          idToken: "idToken",
          accessToken: "accessToken",
          expiresAt: DateTime.now(),
          user: UserProfile(
            sub: "idUnique",
            name: "nom"
          ),
          tokenType: "tokenType"));

      when(utilisateurControleur.getOrInsertUtilisateur("idUnique", "nom"))
        .thenAnswer((_) async => Utilisateur("idUnique", "nom", List<Role>.empty()));

      final utilisateurProvider = UtilisateurProvider(auth0, auto0web, utilisateurControleur);

      expect(utilisateurProvider.isLoggedIn, false);

      await utilisateurProvider.loginAction();

      expect(utilisateurProvider.isLoggedIn, true);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => MockUtilisateurProvider(),
            child: CombatPage(id: 1),
          ),
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(TabBarView), findsNothing);
      expect(find.text("Vous n'avez pas le droit de voir ceci"), findsOneWidget);
    });

    testWidgets('Si nous sommes pas Admin, il est possible de faire la page combat', (WidgetTester tester) async {

      // Arrange
      final auto0web = MockAuth0Web();
      final auth0 = MockAuth0();
      final webAuthentication = MockWebAuthentication();
      final utilisateurControleur = MockUtilisateurControleur();

      when(auth0.webAuthentication(scheme: "com.auth0.sample"))
        .thenReturn(webAuthentication);

      when(webAuthentication.login())
        .thenAnswer((_) async => Credentials(
          idToken: "idToken",
          accessToken: "accessToken",
          expiresAt: DateTime.now(),
          user: UserProfile(
            sub: "idUnique",
            name: "nom"
          ),
          tokenType: "tokenType"));

      when(utilisateurControleur.getOrInsertUtilisateur("idUnique", "nom"))
        .thenAnswer((_) async => Utilisateur("idUnique", "nom", List<Role>.empty()));

      final utilisateurProvider = UtilisateurProvider(auth0, auto0web, utilisateurControleur);

      expect(utilisateurProvider.isLoggedIn, false);

      await utilisateurProvider.loginAction();

      expect(utilisateurProvider.isLoggedIn, true);

      when(utilisateurProvider.hasRole("admin")).thenReturn(true);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => MockUtilisateurProvider(),
            child: CombatPage(id: 1),
          ),
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(TabBarView), findsOneWidget);
      expect(find.text("Vous n'avez pas le droit de voir ceci"), findsNothing);
    });
  });
}