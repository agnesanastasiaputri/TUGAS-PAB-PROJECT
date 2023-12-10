import 'package:filmin/screens/favorite_screen.dart';
import 'package:filmin/screens/profile_screen.dart';
import 'package:filmin/screens/rate_screen.dart';
import 'package:filmin/widgets/film_card.dart';
import 'package:flutter/material.dart';
import 'package:filmin/screens/home_screen.dart';
import 'package:filmin/screens/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FILMIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
        ),
        useMaterial3: true,
      ),
      home: MainScreen(),
      initialRoute: '/',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/ratescreen': (context) => const RateScreen(),
        '/favoritescreen' : (context) => const FavoriteScreen(),
        '/profilescreen' : (context) => const ProfileScreen()
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    RateScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 19, 17, 17),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Menu button pressed');
          },
        ),
        title: Text(
          'FILMIN',
          style: TextStyle(
            color: Colors.white, // Warna teks title
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button pressed');
            },
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        //TODO: 4. Buat data dan child dari Theme
        data: Theme.of(context).copyWith(canvasColor: Color.fromARGB(255, 19, 17, 17)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              label: 'Rate',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: Colors.white38,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
