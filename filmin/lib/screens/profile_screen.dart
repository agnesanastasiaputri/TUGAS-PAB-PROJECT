import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.menu, // Ikon garis tiga (hamburger)
                color: Colors.white,
              ),
              onPressed: () {
                // Tambahkan fungsi yang ingin dijalankan saat tombol hamburger ditekan
              },
            ),
            SizedBox(width: 8), // Jarak antara ikon dan teks 'FILMIN'
            Text(
              'FILMIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search, // Ikon pencarian (search)
              color: Colors.white,
            ),
            onPressed: () {
              // Tambahkan fungsi yang ingin dijalankan saat tombol pencarian ditekan
            },
          ),
        ],
      ),
    );
  }
}