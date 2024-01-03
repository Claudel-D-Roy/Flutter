import 'package:flutter_test/flutter_test.dart';
import 'package:ggteammobile_tp/models/utilisateur.dart';
import 'package:mockito/mockito.dart';
import 'package:ggteammobile_tp/Controllers/utilisateur_controleur.dart';
import 'package:ggteammobile_tp/Controllers/role_controleur.dart';

// Mock du RoleControleur
class MockRoleControleur extends Mock implements RoleControleur {}

void main() {
  group('UtilisateurControleur', () {
    test('getOrInsertUtilisateur returns a user with roles', () async {
      // Arrange
      final mockRoleControleur = MockRoleControleur();
      final utilisateurControleur = UtilisateurControleur();

      final userId = 'exampleId';
      final userName = 'exampleUserName';

      // Act
      final utilisateur = await utilisateurControleur.getOrInsertUtilisateur(userId, userName);

      // Assert
      expect(utilisateur, isA<Utilisateur>());
      // Ajoutez d'autres assertions selon les besoins
    });
  });
}