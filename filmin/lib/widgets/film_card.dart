import 'package:filmin/data/film_data.dart';
import 'package:filmin/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:filmin/models/film.dart';
// import 'package:filmin/screens/detail_screen.dart';

class FilmCard extends StatefulWidget {

  const FilmCard({super.key});

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  List<Film> _filterFilms = filmList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2: Buat AppBar dengan judul Pencarian_Candi
      appBar: AppBar(
        title: const Text("Pencarian Candi"),
      ),
      // TODO 3: Buat Body berupa Column
      body: Column(
        children: [
          // TODO 5: Buat ListView hasil pencarian sebagai anak dari column
          Expanded(
            child: ListView.builder(
              itemCount: _filterFilms.length,
              itemBuilder: (context, index) {
                final film = _filterFilms[index];
                // TODO 8: Implementasi GestureDetetor dan Hero animation
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          child: Image.asset(
                            film.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              film.judul,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(film.judul)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
