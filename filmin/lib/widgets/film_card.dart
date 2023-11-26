import 'package:flutter/material.dart';
import 'package:filmin/models/film.dart';
// import 'package:filmin/screens/detail_screen.dart';

class FilmCard extends StatelessWidget {
  final Film film;
  const FilmCard({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
          vertical: 2,
        ),
        child: Container(
          constraints:
              BoxConstraints.expand(), // Mengambil sebanyak mungkin ruang
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 100,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8), // Atur sesuai kebutuhan
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
                      Text(
                        film.judul,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(Icons.star, size: 16, color: Colors.yellow),
                          SizedBox(width: 4),
                          // Text(
                          //   '${film.rating}',
                          //   style: TextStyle(fontSize: 14),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
