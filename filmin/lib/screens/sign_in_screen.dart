import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO: 1. Deklarasikan variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignedIn = false;
  bool _obscurePassword = true;

  void _signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _errorText = 'Nama pengguna dan kata sandi harus diisi';
      });
      return;
    }
    if (savedUsername.isEmpty || savedPassword.isEmpty) {
      setState(() {
        _errorText =
            'Pengguna belum terdaftar. Silahkan daftar terlebih dahulu.';
      });
      return;
    }
    if (enteredUsername == savedUsername && enteredPassword == savedPassword) {
      setState(() {
        _errorText = '';
        _isSignedIn = true;
        prefs.setBool('isSignedIn', true);
      });
      //Pemanggilan untuk menghapus semua halaman dalam tumpukan navigasi
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
      //Sign In berhasil, navigasikan ke layar utama
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/');
      });
    } else {
      setState(() {
        _errorText = 'Nama pengguna atau kata sandi salah.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang AppBar
      appBar: AppBar(
        title: const Text('FILMIN'),
      ),
      // TODO: 3. Pasang body
      backgroundColor: Colors.black,
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            child: Column(
          // TODO: 4. Atur mainAxisAlignment dan crossAxisAlignment
          children: [
            Image.asset(
              'images/logo.jpg',
              height: 500,
              width: 500,
              fit: BoxFit.cover,
            ),
            // TODO: 5. Pasang TextFormField Nama Pengguna
            TextFormField(
              cursorColor: Colors.black,
              controller: _usernameController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "Nama Pengguna",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                isDense: true
              ),
            ),
            // TODO: 6. Pasang TextFormField Kata Sandi
            SizedBox(height: 20),
            TextFormField(
              cursorColor: Colors.black,
              controller: _passwordController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "Kata Sandi",
                errorText: _errorText.isNotEmpty ? _errorText : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              obscureText: _obscurePassword,
            ),
            // TODO: 7. Pasang ElevotedButton Sign In
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text('Sign In')),
            // TODO: 8. Pasang TextButton Sign Up
            SizedBox(height: 10),
            //...
            RichText(
              text: TextSpan(
                text: 'Belum punya akun? ',
                style: TextStyle(fontSize: 16, color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Daftar di sini. ',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 16),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/signup');
                      },
                  ),
                ],
              ),
            )
          ],
        )),
      ))),
    );
  }
}
