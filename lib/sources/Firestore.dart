import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetAgent extends StatelessWidget {
  final String feature;
  final String agentId;

  const GetAgent(this.agentId, this.feature, {super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference agents =
        FirebaseFirestore.instance.collection('karakterler');
    return FutureBuilder<DocumentSnapshot>(
      future: agents.doc(agentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (feature == 'img') {
            return Image.network(
              '${data['imgURL']}',
              height: 250,
              width: 250,
            );
          } else if (feature == 'name') {
            return Text('${data['name']}');
          } else if (feature == 'hakkinda') {
            return Text('${data['hakkinda']}');
          } else if (feature == 'rol') {
            return Text('${data['rol']}');
          }
        }

        return const Text("loading");
      },
    );
  }
}
