import 'package:flutter/material.dart';
import 'package:ca_folders/config/routes/app_routes.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Architecture Practice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  child: const Text('Mostrar Informacion de Usuarios',
                      style: const TextStyle(fontSize: 21)),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.userData),
                )),
            SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  child: const Text('Mostrar Informacion del Usuario Actual ',
                      style: const TextStyle(fontSize: 21)),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.myUser),
                )),
          ],
        ),
      ),
    );
  }
}
