import 'package:filmin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  Future<String> getUsernameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    return username ?? 'No Username';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Container(
                width: 120,
                height: 120,
                color: Colors.white,
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('images/logo.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 22),
            // Menempatkan username di atas
            FutureBuilder<String>(
            future: getUsernameFromSharedPreferences(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
            const SizedBox(height: 24),

            const SizedBox(height: 100), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 170),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
