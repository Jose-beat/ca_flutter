import 'dart:convert';
/// Modelo
/// Este modelo funciona para poder decodificar la informacion que viene en forma de string con formato JSON
/// a objetos que pueda interpretar nuestra programacion, este es el archivo principal que hay que codificar
///
///
///
///
///
/// Con los primeros metodos creamos metodos globales que invoquen a los metodos de codificacio y decodificacion de la clase
User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

/// Aqui tenemos la clase User que usaremos como base para nuestros datos
class User {
  ///Al ser esta una clase para decodificar el JSON pediremos en el constructor un objeto UserDetail que vamos a decodificar
  User({
    required this.userDetail
  });

  final List<UserDetail>userDetail;

  ///Con este metodo vamos a convertir el JSON que nos da la API en una lista con los detalles de los usuarios
  ///Practicamente vamos a decodificar el JSON una segunda vez
  factory User.fromJson(Map<String, dynamic> json) => User(
    userDetail: List<UserDetail>.from(json["results"].map((x)=> UserDetail.fromJson(x))),
  );
  ///Vamos a declarar que nuestra clase User solo sera una lista llamada "Resultados"
  Map<String, dynamic> toJson()=>{
    "results": List<dynamic>.from(userDetail.map((x) => x.toJson())),
  };
}

///Ahora tenemos la clase que, al tener un JSON que viene en forma de un arreglo de objetos, usaremos como entidad para cada usuario
///Aqui accederemos a sus detalles y propiedades
class UserDetail{
  UserDetail({
    required this.name,
    required this.email,
    required this.gender,
    required this.location,
    required this.picture,
    required this.nat
  });

  final Map<String, dynamic> name;
  final String gender;
  final String email;
  final Map<String,  dynamic> location;
  final Map<String, dynamic> picture;
  final String nat;


  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(

      name: json["name"],
      email: json["email"],
      gender: json["gender"],
      location: json["location"],
      picture: json["picture"],
      nat: json["nat"]
  );

  Map<String, dynamic> toJson()=>{
    "name": name,
    "email": email,
    "gender":gender,
    "location": location,
    "picture": picture,
    "nat": nat
  };

}