import 'package:flutter/material.dart';
import 'package:valorant_rehber/assets/textfiles/textfile.dart';
import 'package:valorant_rehber/models/Carousel_Model.dart';
import 'package:valorant_rehber/sources/Storage.dart';
import 'package:valorant_rehber/sources/firestore.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});
  final int _current = 0;

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Form(
            child: Row(
              children: [
                const GetAgent(IdAgentClass.idAstra, 'img'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    GetAgent(IdAgentClass.idAstra, 'rol'),
                    GetAgent(IdAgentClass.idAstra, 'name'),
                  ],
                ),
              ],
            ),
          ),
          CarouselDemo(),
        ]));
  }
}
