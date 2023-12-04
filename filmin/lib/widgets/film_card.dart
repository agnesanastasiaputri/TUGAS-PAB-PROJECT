import 'package:filmin/data/film_data.dart';
import 'package:flutter/material.dart';
import 'package:filmin/models/film.dart';
import 'package:filmin/screens/detail_screen.dart';

// class FilmCard extends StatelessWidget {
//   //TODO: 1. Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
//   final Film film;

//   const Film({super.key, required this.film});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DetailScreen(film: film)),
//         );
//       },

//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         margin: EdgeInsets.all(4),
//         elevation: 1,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//                       Expanded(
//             child: ListView.builder(
//               itemCount: _filterFilms.length,
//               itemBuilder: (context, index) {
//                 final film = _filterFilms[index];
//                 // TODO 8: Implementasi GestureDetetor dan Hero animation
//                 return Card(
//                   margin: EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 4,
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(8),
//                         width: 100,
//                         height: 100,
//                         child: ClipRRect(
//                           child: Image.asset(
//                             film.imageAsset,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               film.judul,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               )
//                             ),
//                             const SizedBox(
//                               height: 4,
//                             ),
//                             Text(film.judul)
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//       ),

class FilmCard extends StatefulWidget {
  const FilmCard({super.key});

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  List<Film> _filterFilms = filmList;

  void _navigateToDetailScreen(Film film) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(film: film),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pencarian Film"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _filterFilms.length,
              itemBuilder: (context, index) {
                final film = _filterFilms[index];

                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _navigateToDetailScreen(film);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: film.judul,
                          child: Container(
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
                                ),
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




// class _FilmCardState extends State<FilmCard> {
//   List<Film> _filterFilms = filmList;

//   void _navigateToDetailScreen(Film film) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DetailScreen(film: film),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // TODO 2: Buat AppBar dengan judul Pencarian_Candi
//       appBar: AppBar(
//         title: const Text("Pencarian Film"),
//       ),
//       // TODO 3: Buat Body berupa Column
//       body: Column(
//         children: [
//           // TODO 5: Buat ListView hasil pencarian sebagai anak dari column
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filterFilms.length,
//               itemBuilder: (context, index) {
//                 final film = _filterFilms[index];
//                 // TODO 8: Implementasi GestureDetetor dan Hero animation
//                 return Card(
//                   margin: EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 4,
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(8),
//                         width: 100,
//                         height: 100,
//                         child: ClipRRect(
//                           child: Image.asset(
//                             film.imageAsset,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(film.judul,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 )),
//                             const SizedBox(
//                               height: 4,
//                             ),
//                             Text(film.judul)
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
