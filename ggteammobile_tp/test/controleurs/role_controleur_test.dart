import 'package:flutter_test/flutter_test.dart';
import 'package:ggteammobile_tp/Controllers/role_controleur.dart';
import 'package:ggteammobile_tp/models/role.dart';
import 'package:mockito/mockito.dart';

class MockRoleController extends Mock implements RoleControleur {}

void main() {
  late MockRoleController sut;

  group('RoleControleur', () {
    test('getRolesByIdUtilisateur retourne une liste de roles', () async {
      // Arrange
      sut = MockRoleController();
      final idUtilisateur = 'exampleId'; // Remplacez par un ID de test approprié

      // Act
      final roles = await sut.getRolesByIdUtilisateur(idUtilisateur);

      // Assert
      expect(roles, isA<List<Role>>());

    });
  });
}