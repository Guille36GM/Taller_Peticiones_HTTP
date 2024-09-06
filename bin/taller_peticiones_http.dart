// main.dart
import 'user.dart';
import 'user_service.dart';

void main() async {
  try {
    List<User> users = await fetchUsers();

    // Filtrar y mostrar usuarios con username de más de 6 caracteres
    filterUsersByUsername(users);

    // Contar e imprimir usuarios con correo del dominio "biz"
    countUsersWithBizDomain(users);
  } catch (e) {
    print('Error: $e');
  }
}
