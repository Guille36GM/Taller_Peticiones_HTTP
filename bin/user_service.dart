// user_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

// Función que obtiene los usuarios desde la API
Future<List<User>> fetchUsers() async {
  const url = 'https://jsonplaceholder.typicode.com/users';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    List<User> users = jsonData.map((user) => User.fromJson(user)).toList();
    return users;
  } else {
    throw Exception('Error al obtener usuarios');
  }
}

// Función que filtra y muestra los usuarios cuyo username tiene más de 6 caracteres
void filterUsersByUsername(List<User> users) {
  List<User> filteredUsers =
      users.where((user) => user.username.length > 6).toList();

  print('Usuarios con username de más de 6 caracteres:');
  for (var user in filteredUsers) {
    print('${user.name} - ${user.username}');
  }
}

// Función que cuenta e imprime la cantidad de usuarios cuyo email tiene el dominio "biz"
void countUsersWithBizDomain(List<User> users) {
  int count = users.where((user) => user.email.endsWith('.biz')).length;
  print('Cantidad de usuarios con dominio .biz en su email: $count');
}
