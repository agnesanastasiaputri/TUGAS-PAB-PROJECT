import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'Username';
  String fullname = 'Fullname';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Container(
                width: 120,
                height: 120,
                color: Colors.white,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('images/dd.png'),
                ),
              ),
            ),
            SizedBox(height: 22),
            // Menempatkan username di atas
            Text(
              username,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5), // Memberikan jarak antara username dan fullname
            // Menempatkan fullname di bawah
            Text(
              fullname,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 24),

            SizedBox(height: 100), // Memberikan ruang kosong di atas tombol Logout
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 170), // Mengatur padding
              ),
              child: Text(
                'SignOut',
                style: TextStyle(
                  color: Colors.black, // Mengatur warna teks menjadi hitam
                  fontWeight: FontWeight.bold, // Mengatur tebal
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}