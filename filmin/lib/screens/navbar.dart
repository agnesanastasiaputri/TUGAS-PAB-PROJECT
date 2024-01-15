import 'dart:io';

import 'package:filmin/main.dart';
import 'package:filmin/screens/about_screen.dart';
import 'package:filmin/screens/favorite_screen.dart';
import 'package:filmin/screens/profile_screen.dart';
import 'package:filmin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key});

  Future<String> getUsernameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    return username ?? 'No Username';
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: FutureBuilder<String>(
                future: getUsernameFromSharedPreferences(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!);
                  } else {
                    return const Text('Loading...');
                  }
                },
              ),
              accountEmail: const Text(''),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'images/logo.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 19, 17, 17))),
          // ListTile(
          //     iconColor: Colors.white,
          //     leading: const Icon(Icons.home),
          //     title: const Text('Halaman Depan'),
          //     textColor: Colors.white,
          //     onTap: () => {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const MainScreen()))
          //         }),
          // ListTile(
          //     iconColor: Colors.white,
          //     leading: const Icon(Icons.favorite),
          //     title: const Text('Favorit'),
          //     textColor: Colors.white,
          //     onTap: () => {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const FavoriteScreen(
          //                         favoriteFilms: [],
          //                       )))
          //         }),
          // ListTile(
          //     iconColor: Colors.white,
          //     leading: const Icon(Icons.person),
          //     title: const Text('Profile'),
          //     textColor: Colors.white,
          //     onTap: () => {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const ProfileScreen()))
          //         }),
          ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              textColor: Colors.white,
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutScreen()))
                  }),
          const Divider(),
          ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log Out'),
              textColor: Colors.white,
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    )
                  }),
        ],
      ),
    );
  }
}
