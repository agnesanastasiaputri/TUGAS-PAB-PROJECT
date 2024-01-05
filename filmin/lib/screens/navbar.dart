import 'package:filmin/main.dart';
import 'package:filmin/screens/favorite_screen.dart';
import 'package:filmin/screens/home_screen.dart';
import 'package:filmin/screens/profile_screen.dart';
import 'package:filmin/screens/rate_screen.dart';
import 'package:filmin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    return Text('Loading...');
                  }
                },
              ),
              accountEmail: Text(''),
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
                  BoxDecoration(color: Color.fromARGB(255, 19, 17, 17))),
          ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.home),
              title: Text('Halaman Depan'),
              textColor: Colors.white,
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()))
                  }),
          ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.star),
              title: Text('Rekomendasi Film'),
              textColor: Colors.white,
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RateScreen()))
                  }),
          ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.favorite),
              title: Text('Favorit'),
              textColor: Colors.white,
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteScreen()))
                  }),
          ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.person),
              title: Text('Profile'),
              textColor: Colors.white,
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()))
                  }),
          Divider(),
          ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
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
