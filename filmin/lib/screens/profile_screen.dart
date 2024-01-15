import 'dart:io';

import 'package:filmin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

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

  File? image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('imagePath', image!.path);
    }
  }

  @override
void initState() {
  super.initState();
  _getImageFromSharedPreferences();
}

Future<void> _getImageFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? imagePath = prefs.getString('imagePath');
  if (imagePath != null) {
    setState(() {
      image = File(imagePath);
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipOval(
                  child: Container(
                    width: 120,
                    height: 120,
                    color: Colors.white,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: image != null ? FileImage(image!) : null,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () async {
                      await _pickImage();
                    },
                    icon: Icon(Icons.camera_alt),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
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
                padding: const EdgeInsets.symmetric(horizontal: 80),
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
