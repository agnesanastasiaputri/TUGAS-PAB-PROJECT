import 'package:filmin/models/film.dart';
import 'package:filmin/screens/detail_screen.dart';
import 'package:filmin/widgets/film_card.dart';
import 'package:flutter/material.dart';
import 'package:filmin/data/film_data.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  List<Film> _filterFilms = filmList;

  @override
  Widget build(BuildContext context) {
    _filterFilms.sort((a, b) => b.rating.compareTo(a.rating));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _filterFilms.length,
              itemBuilder: (context, index) {
                final film = _filterFilms[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(film: film),
                      ),
                    );
                  },
                  child: Card(
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(film.judul,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      film.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      film.favorite.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
