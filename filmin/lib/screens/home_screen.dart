import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
 final String filmTitle;
 final String filmImageUrl;

 HomeScreen({
    Key? key,
    required this.filmTitle,
    required this.filmImageUrl,
 }) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(filmTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              filmImageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            // Anda bisa menambahkan elemen lain di sini jika diperlukan
          ],
        ),
      ),
    );
 }
}