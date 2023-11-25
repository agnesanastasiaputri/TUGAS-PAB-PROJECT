// import 'package:flutter/material.dart';
// import 'package:filmin/screens/logo_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FILMIN',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => LogoScreen(),
        
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/detail_screen.dart';
import 'package:wisata_candi/screens/favorite_screen.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/search_screen.dart';
import 'package:wisata_candi/screens/sign_in.dart';
import 'package:wisata_candi/screens/sign_up_screen.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/widgets/item_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      //home: SignUpScreen()
      home: MainScreen(),
      //home: HomeScreen(),
      //home: SearchScreen(),
      //home: SignInScreen(),
      //home: ProfileScreen(),
      //home: DetailScreen(candi: candiList[0]),
      initialRoute: '/',
      routes:{
        '/homescreen' : (context) => const HomeScreen(),
        '/signin' : (context) => SignInScreen(),
        '/signup' : (context) => const SignUpScreen(),
      }
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //TODO: 1. Deklarasikan variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    RateScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      //TODO: 3. Buat properti bottonNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
        //TODO: 4. Buat data dan child dari Theme
        data: Theme.of(context).copyWith(canvasColor: Colors.deepPurple[50]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.deepPurple,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  color: Colors.deepPurple,
                ),
                label: 'Rate'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.deepPurple,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
