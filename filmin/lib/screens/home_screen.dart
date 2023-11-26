import 'package:flutter/material.dart';

class Film {
 String judul;
 String cover;
 double rating;
 int totalRating;

 Film({
    required this.judul,
    required this.cover,
    required this.rating,
    required this.totalRating,
 });
}

List<Film> daftarFilm = [
 Film(
    judul: 'Film 1',
    cover: 'cover1.jpg',
    rating: 5.0,
    totalRating: 80000,
 ),
 Film(
    judul: 'Film 2',
    cover: 'cover1.jpg',
    rating: 5.0,
    totalRating: 80000,
 ),
 Film(
    judul: 'Film 3',
    cover: 'cover1.jpg',
    rating: 5.0,
    totalRating: 80000,
 ),
 Film(
    judul: 'Film 4',
    cover: 'cover1.jpg',
    rating: 5.0,
    totalRating: 80000,
 ),
 Film(
    judul: 'Film 5',
    cover: 'cover1.jpg',
    rating: 5.0,
    totalRating: 80000,
 ),
 Film(
    judul: 'Film 6',
    cover: 'cover1.jpg',
    rating: 5.0,
    totalRating: 80000,
 ),
 Film(
    judul: 'Film 7',
    cover: 'cover1.jpg',
    rating: 5.0,
    totalRating: 80000,
 ),
 Film(
    judul: 'Film 8',
    cover: 'cover1.jpg',
    rating: 5.0,
    totalRating: 80000,
 ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 25, 25),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        padding: EdgeInsets.all(8),
        itemCount: filmList.length,
        itemBuilder: (context, index) {
          final film = daftarFilm[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Container(
              color: Colors.white, // Ubah warna latar belakang menjadi putih
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      child: Image.asset(
                        film.cover,
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
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star, size: 16, color: Colors.yellow),
                                  SizedBox(width: 4),
                                ],
                              ),
                              Text(
                                '${film.rating}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
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
    );
  }
}