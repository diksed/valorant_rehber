import 'package:flutter/material.dart';
import 'package:valorant_rehber/assets/textfiles/textfile.dart';

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
        return Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10,
          margin: const EdgeInsets.all(10),
          child: Image.asset(entries[index]),
        );
      },
    );
  }
}
