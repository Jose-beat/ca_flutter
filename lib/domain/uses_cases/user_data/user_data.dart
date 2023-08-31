import 'dart:ffi';

import '../../models/user_data/user_data.dart';
import '../../models/user_data/gateway/user_data_gateway.dart';

///De manera general definimos los casos de uso como una capa que contiene reglas comerciales especificas de la aplicacion.
///Alli se encapsulan e implementan todos los casos de uso del sistema.
///
///Estos casos de uso organizan el flujo de datos hacia y desde las entidades
///
///Nos esperamos muchos cambios en esta capa cuando se realizan modificaciones en interfaz de usuario, DB o marcos comunes
///En caso de haber cambios en el comportamiento y funcion de la app si esperamos cambios.
class UserUseCase {
  final UserGateway _userGateway;
  final int _quantityUser;
  UserUseCase(this._userGateway, this._quantityUser);

  ///Hay que tender a definir metodos en los casos de uso con nombres simples y con pocos tecnisismos.
  Future<List<UserDetail>> getAllUsers() =>
      _userGateway.getUsers(_quantityUser);

  ///Con nuestro parametro, el caso de uso lo requerira para inyectarlo en el gateway.
}
