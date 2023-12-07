import 'package:flutter/material.dart';
import 'package:filmin/widgets/Profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //TODO 1: Deklarasi variabel (state) yang dibituhkan
  bool isSignIn = false;
  String fullName = "Fa";
  String userName = "Do";
  int favouriteCandiCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.black87,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //TODO: 2. Buat Bagiam ProfileHeader yang berisi foto profil
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200 - 50),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.deepOrange, width: 2),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage("images/logo.jpg"),
                        ),
                      ),
                      if (isSignIn)
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ))
                    ],
                  ),
                ),
              ),
              
//TODO: 3. Buat Bagiam ProfileInfo yang berisi info profil
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.deepPurple[100],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ProfileInfoItem(
                      icon: Icons.lock,
                      label: 'Pengguna',
                      value: userName,
                      iconColor: Colors.amber,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.deepPurple[100],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ProfileInfoItem(
                        icon: Icons.person,
                        label: 'Nama',
                        value: fullName,
                        showEditIcon: isSignIn,
                        onEditPressed: () {
                          debugPrint('Icon edit ditekan ...');
                        },
                        iconColor: Colors.blue),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.deepPurple[100],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ProfileInfoItem(
                        icon: Icons.favorite,
                        label: 'Favorit',
                        value:
                            favouriteCandiCount > 0 ? '$favouriteCandiCount' : '',
                        iconColor: Colors.red),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.deepPurple[100],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //TODO: 2. Buat Bagiam ProfileAction yang berisi textButton signin/signout
                    isSignIn
                        ? TextButton(
                            onPressed: () {},
                            child: Text('Sign Out'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.amber,
                                padding: const EdgeInsets.all(20),
                                elevation: 5),
                          )
                        : TextButton(
                            onPressed: () {},
                            child: Text('Sign In'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.amber,
                                padding: const EdgeInsets.all(20),
                                elevation: 5),
                          )
                  ],
                ),
              ),
            ],
          )
        )
        ],
      ),
    );
  }
}