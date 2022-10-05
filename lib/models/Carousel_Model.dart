// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valorant_rehber/assets/textfiles/textfile.dart';
import 'package:valorant_rehber/sources/storage.dart';

import '../sources/firestore.dart';

// ignore: must_be_immutable
class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  final Storage storage = Storage();
  late int initialPage = 0;
  CarouselDemo({super.key});

  @override
  Widget build(BuildContext context) => Column(children: [
        CarouselSlider(
          items: AgentsList().agents.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: StringClass.valRenk),
                    child: agentFutureBuilder(i.toString()));
              },
            );
          }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              initialPage = index;

              print(initialPage);
              print(AgentsList().agentsId[initialPage]);
            },
            viewportFraction: 0.3,
            aspectRatio: 4.0,
            initialPage: initialPage,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
        ),
      ]);

  agentDesc() {
    return Row(
      children: [
        GetAgent(AgentsList().agentsId[initialPage], 'img'),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GetAgent(AgentsList().agentsId[initialPage], 'rol'),
            GetAgent(AgentsList().agentsId[initialPage], 'name'),
          ],
        ),
      ],
    );
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
