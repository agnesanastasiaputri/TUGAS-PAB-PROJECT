import 'package:filmin/main.dart';
import 'package:filmin/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedin = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedin: isLoggedin));
}

class MyApp extends StatelessWidget {
  final bool isLoggedin;

  MyApp({required this.isLoggedin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login with SharedPreferences',
      home: isLoggedin ? HomeScreen() : SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Page'),
      //   backgroundColor: Colors.black,
      // ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.jpg',
                height: 350,
                width: 350,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                  )),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _handleLogin();
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  _navigateToSignup();
                },
                child: Text('Create an account',
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String storedUsername = prefs.getString('username') ?? '';
      String storedPassword = prefs.getString('password') ?? '';
      int loginTime = prefs.getInt('loginTime') ?? 0;

      if (username == storedUsername && password == storedPassword) {
        prefs.setBool('isLoggedIn', true);
        prefs.setInt('loginTime', DateTime.now().millisecondsSinceEpoch);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('    Login Failed'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Wrong Pass or invalid User.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('    Login Failed'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Username and password cannot be empty.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
        backgroundColor: Colors.black ,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.jpg',
                height: 350,
                width: 350,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                  )),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _handleSignup();
                },
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignup() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);
      prefs.setString('password', password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('    Signup Failed'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Wrong Pass or invalid User.'),
                  // Image.network(
                  //   'https://media.tenor.com/b5_GZ8tV6oEAAAAi/pikachu-pokemon.gif',
                  //   height: 200,
                  //   width: 200,
                  // ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
