import 'package:ca_folders/config/providers/user_data_providers.dart';
import 'package:ca_folders/config/routes/app_routes.dart';
import 'package:ca_folders/ui/pages/homepage.dart';
import 'package:ca_folders/ui/pages/user_data.dart';
import 'package:ca_folders/ui/pages/users_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CleanArchFoldersExampleApp extends ConsumerWidget {
  const CleanArchFoldersExampleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: ThemeData.dark(),
        onGenerateRoute: (routeSetting) {
          switch (routeSetting.name) {
            case (AppRoutes.userData):
              return MaterialPageRoute(
                ///En este caso con nuestro builder vamos a llamar a la pagina donde mostraremos los datos
                ///y le enviaremos nuestro provider que ejecutara el metodo a llamar pero antes inyectara el parametro
                ///que estamos solicitando.
                  builder: ((context) => ShowUserDataPage(
                        userDetailList: ref.watch(userProvider(3)).getAllUsers(),
                      )));
            case (AppRoutes.myUser):
                return MaterialPageRoute(
                    builder: ((context) => ShowMyUserDataPage(
                      userDetailList: ref.watch(userProvider(0)).getAllUsers(),
                    ))
                );
            default:
              return MaterialPageRoute(
                  builder: ((context) => const Homepage()));
          }
        });
  }
}
