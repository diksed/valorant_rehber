import 'package:flutter/material.dart';
import 'package:valorant_rehber/assets/textfiles/textfile.dart';
import 'package:valorant_rehber/sources/Storage.dart';
import 'package:valorant_rehber/sources/firestore.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Row(
        children: [
          const GetAgent(IdAgentClass.idAstra, 'img'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              GetAgent(IdAgentClass.idAstra, 'rol'),
              GetAgent(IdAgentClass.idAstra, 'name'),
            ],
          ),
        ],
      ),
    ]));
  }

  FutureBuilder<String> agentFutureBuilder(String path) {
    return FutureBuilder(
      future: storage.downloadURL(path),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Card(
            child: Image.network(
              snapshot.data!,
              fit: BoxFit.cover,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }
}
