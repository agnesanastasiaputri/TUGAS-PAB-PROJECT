import 'package:filmin/models/film.dart';
import 'package:filmin/widgets/film_card.dart';
import 'package:flutter/material.dart';
import 'package:filmin/data/film_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Film film = filmList[index];
          return FilmCard(film: film,);
        },
      ),
    );
  }
}



//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 26, 25, 25),
//       body: GridView.builder(
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
//         padding: EdgeInsets.all(8),
//         itemCount: filmList.length,
//         itemBuilder: (context, index) {
//           final film = filmList[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(
//               horizontal: 2,
//               vertical: 2,
//             ),
//             child: Container(
//               color: Color.fromARGB(255, 255, 255, 255),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 70,
//                     height: 100,
//                     child: ClipRRect(
//                       child: Image.asset(
//                         film.imageAsset,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             film.judul,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: const [
//                                   Icon(Icons.star,
//                                       size: 16, color: Colors.yellow),
//                                   SizedBox(width: 4),
//                                 ],
//                               ),
//                               // Text(
//                               //   '${film.rating}',
//                               //   style: const TextStyle(fontSize: 14),
//                               // ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
