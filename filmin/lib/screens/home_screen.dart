import 'package:flutter/material.dart';
import 'package:filmin/data/film_data.dart';
import 'package:filmin/models/film.dart';
import 'package:filmin/widgets/film_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FILMIN'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        padding: EdgeInsets.all(8),
        itemCount: filmList.length,
        itemBuilder: (context, index) {
          Film film = filmList[index];
          return FilmCard(
            film: film,
          );
        },
      ),
    );
  }
}
