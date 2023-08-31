import 'dart:ffi';

import 'package:ca_folders/domain/models/user_data/user_data.dart';
import 'package:ca_folders/domain/models/user_data/gateway/user_data_gateway.dart';
import 'package:ca_folders/infraestructure/driven_adapter/api/errors/user_data_api_error.dart';
import 'package:http/http.dart' as http;

/// Como parte de los driven adapter tenemos los metodos que implementaran y consumiran los datos de la API
/// Se conocen como Driven Adapters ya que son la conexion con el exterior, conforme a las necesidades que tengamos.
///
/// Ahora con el parametro inyectado en el gateway nos queda el pasarlo como parametro de nuestra funcion y en este caso implementarlo.
class UserApi extends UserGateway {
  @override
  Future<List<UserDetail>> getUsers(final int quantityUsers) async {
    ///Primero definimos la URL de donde vendran nuestros datos
    Uri url = Uri(
        scheme:'https',
        host:'randomuser.me',
        path:'/api/',
        queryParameters: quantityUsers > 0 ? {'results': '$quantityUsers'} : {}
    );

    ///Ahora reallizaremos una solicitud de tipo GET para obtener los datos de la URL
    final response = await http.get(url);
    ///Ahora condicionamos que si la respuesta del servidor es 200 vamos a obtener los datos y convertirlos en objetos (Esto gracias a nuestros modelos en el dominio)
    if (response.statusCode == 200) {

      ///Con los metodos Lambda vamos a obtener primero el listado de los resultados
      final user = userFromJson(response.body);

      ///Aqui ya vamos a invocar a los usuarios de manera individual
      final userDetail = user.userDetail;
      ///ambas son listas, la diferencia es que la primera
      return userDetail;

    } else {

      throw UserDataApiError();

    }
  }
}
