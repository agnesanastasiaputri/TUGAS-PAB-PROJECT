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
  String fullName = "Nelson Saputra Edika";
  String userName = "Nelson";
  int favouriteCandiCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.deepPurple,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          radius: 50,
                          backgroundImage:
                              AssetImage("images/placeholder_image.png"),
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
              



              //TODO: 2. Buat Bagiam ProfileAction yang berisi textButton signin/signou