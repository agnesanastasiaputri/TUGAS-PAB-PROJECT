import 'package:flutter/material.dart';
import 'package:filmin/models/film.dart';
// import 'package:filmin/screens/detail_screen.dart';

class FilmCard extends StatelessWidget {
  //TODO: 1. Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
  final Film film;

  const FilmCard({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    //TODO: 6. Implementasi routing ke DetailScreen
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => DetailScreen(film: film)),
      //   );
      // },
      child: Card(
        //TODO: 2. Tetapkan parameter shape, margin, dan elevation dari Card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: 3. Buat Image sebagai anak dari Column
            Expanded(
              //TODO: 7. Implementasi Hero animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  film.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //TODO: 4. Buat Text sebagai anak dari Column
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8),
              child: Text(
                film.judul,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //TODO: 5. Buat Text sebagai anak dari Column
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8),
              child: Text(
                film.tanggalRilis,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
