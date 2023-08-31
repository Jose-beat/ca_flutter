import 'dart:io';

import 'package:flutter/material.dart';
import '../../domain/models/user_data/user_data.dart';

class ShowUserDataPage extends StatelessWidget {
  final Future<List<UserDetail>> userDetailList;
  const ShowUserDataPage({Key? key, required this.userDetailList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
      ),
      body: FutureBuilder<List<UserDetail>>(
        future: userDetailList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserDetail  myUser = snapshot.data![0] ;
            return  Column(
              children:[
                Text('${myUser.name["title"]} ${myUser!.name["first"]} ${myUser!.name["last"]}'),
                Center(
                    child: Image.network(myUser.picture["large"], width: 200, height: 200
                    )
                ),
               ButtonBar(
                 children: [
                   Container(margin: const EdgeInsets.only(right: 30.0), child: OutlinedButton(onPressed: (){}, child: const Text("Boton 1"))),
                   Container(margin: const EdgeInsets.only(right: 30.0),child: OutlinedButton(onPressed: (){}, child: const Text("Boton 1"))),
                   Container(child: OutlinedButton(onPressed: (){}, child: const Text("Boton 1"))),
                 ],
                 alignment: MainAxisAlignment.center
               )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
              child: SizedBox(
                  width: 20, height: 20, child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
