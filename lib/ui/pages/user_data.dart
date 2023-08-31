import 'package:flutter/material.dart';
import '../../domain/models/user_data/user_data.dart';

class ShowMyUserDataPage extends StatelessWidget {
  final Future<List<UserDetail>> userDetailList;
  const ShowMyUserDataPage({Key? key, required this.userDetailList}) : super(key: key);

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

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index){
                    UserDetail userDetail = snapshot.data![index];
                    return ListTile(
                      leading: const Icon(Icons.people),
                      title: Text(userDetail.email),
                    );
                  })
              ),
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
