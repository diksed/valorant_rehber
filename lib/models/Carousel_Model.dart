import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valorant_rehber/assets/textfiles/textfile.dart';
import 'package:valorant_rehber/pages/page_lineup.dart';
import 'package:valorant_rehber/sources/Storage.dart';

class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  final Storage storage = Storage();

  CarouselDemo({super.key});

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: AgentsList().agents.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LineupPage()));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Color(0xFFff4654)),
                      child: agentFutureBuilder(i.toString())),
                );
              },
            );
          }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            viewportFraction: 0.3,
            aspectRatio: 5.0,
            initialPage: 0,
          ),
        ),
      ]);

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
