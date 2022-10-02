import 'package:flutter/material.dart';
import 'package:valorant_rehber/assets/textfiles/textfile.dart';
import 'package:valorant_rehber/pages/page_agents.dart';
import 'package:valorant_rehber/pages/page_lineup.dart';
import 'package:valorant_rehber/pages/page_maps.dart';

final List<String> entries = <String>[
  (ImageClass.karakterler),
  (ImageClass.lineup),
  (ImageClass.haritalar)
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeListView(),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 60),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            homeOnTap(context, entries, index);
          },
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Image.asset(entries[index]),
          ),
        );
      },
    );
  }
}

void homeOnTap(BuildContext context, List<String> entries, int index) {
  if (entries[index] == (ImageClass.karakterler)) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AgentsPage()));
  }
  if (entries[index] == (ImageClass.lineup)) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LineupPage()));
  }
  if (entries[index] == (ImageClass.haritalar)) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MapPage()));
  }
}
