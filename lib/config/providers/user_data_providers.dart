import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ca_folders/domain/uses_cases/user_data/user_data.dart';
import 'package:ca_folders/infraestructure/driven_adapter/api/user_data_api/user_data_api.dart';

///En el caso de nuestro providers cambiaremos el metodo por family para poder inyectar uno o mas parametros. En este caso
///el caso de uso resivira de nuestro provider el parametro y en su interior lo inyectara al metodo API el parametro
///el provider sera llamado desde nuestra app e inyectara el parametro antes de ejecutarlo. Tomemos en cuenta que el caso de uso
///solo llama e inyecta los datos y metodos que son necesarios para ejecutarse.
///
final userProvider = Provider.family<UserUseCase, int>((ref, usersQuantity) {
  return UserUseCase(UserApi(), usersQuantity);
});
