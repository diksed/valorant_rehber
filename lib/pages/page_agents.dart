import 'package:flutter/material.dart';
import 'package:valorant_rehber/models/Carousel_Model.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

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
          CarouselDemo().agentDesc(),
          CarouselDemo(),
        ]));
  }
}
