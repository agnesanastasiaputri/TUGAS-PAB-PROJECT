import 'package:filmin/models/film.dart';
import 'package:filmin/screens/detail_screen.dart';
import 'package:flutter/material.dart';

// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});

//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   List<Film> _filterFilms = filmList;

//   @override
//   Widget build(BuildContext context) {
//     _filterFilms.sort((a, b) => b.favorite.compareTo(a.favorite));
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filterFilms.length,
//               itemBuilder: (context, index) {
//                 final film = _filterFilms[index];
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailScreen(film: film),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 4,
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(8),
//                           width: 100,
//                           height: 100,
//                           child: ClipRRect(
//                             child: Image.asset(
//                               film.imageAsset,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(film.judul,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     )),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.star,
//                                       color: Colors.black,
//                                       size: 15,
//                                     ),
//                                     const SizedBox(width: 2),
//                                     Text(
//                                       film.rating.toString(),
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     const Icon(
//                                       Icons.favorite,
//                                       color: Colors.black,
//                                       size: 16,
//                                     ),
//                                     const SizedBox(width: 2),
//                                     Text(
//                                       film.favorite.toString(),
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
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

class FavoriteScreen extends StatefulWidget {
  final List<Film> favoriteFilms;

  const FavoriteScreen({Key? key, required this.favoriteFilms})
      : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.favoriteFilms.length,
              itemBuilder: (context, index) {
                final film = widget.favoriteFilms[index];
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
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
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
                                  Text(film.bahasa,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(film.tanggalRilis,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
