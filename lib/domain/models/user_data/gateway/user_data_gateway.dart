import 'dart:ffi';

import '../user_data.dart';
///Como segundo archivo crearemos nuestro gateway o tambien conocido como repositorio
///Este nos ayudara a declarar las acciones que deseamos realizar sin implementarlar, asi no dependeremos de ninguna capa externa
///Al contrario, todas las capas dependeran de nosotros
///En este caso solo declaramos un getUsers
abstract class UserGateway {
  Future<List<UserDetail>> getUsers(final int quantityUsers);
}
///Agregamos un parametro el cual vamos a ir canalizando por toda la app, primero al definir nuestra clase abstracta, le
///decimos a la funcion que tendra un parametro.