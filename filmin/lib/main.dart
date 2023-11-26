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


import 'package:filmin/screens/logo_screen.dart';
import 'package:filmin/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:filmin/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FILMIN',  //nama di web
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.black).copyWith(
          primary: Colors.black,  //tulisan di button
          surface: Colors.black87,  //background tulisan filmin
        ),
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      //home: SignUpScreen()
      // home: MainScreen(),
      //home: HomeScreen(),
      //home: SearchScreen(),
      home: SignInScreen(),
      //home: ProfileScreen(),
      //home: DetailScreen(candi: candiList[0]),
      initialRoute: '/',
      routes:{
        '/homescreen' : (context) => const HomeScreen(),
        // '/signin' : (context) => SignInScreen(),
        // '/signup' : (context) => const SignUpScreen(),
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
    // RateScreen(),
    // FavoriteScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      //TODO: 3. Buat properti bottonNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
        //TODO: 4. Buat data dan child dari Theme
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
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
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                label: 'Rate'),
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
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
