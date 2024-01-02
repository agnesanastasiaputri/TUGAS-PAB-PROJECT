import 'package:filmin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:filmin/widgets/Profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'Username';
  String fullname = 'Fullname';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(
      //   alignment: Alignment.topCenter,
      //   children: [
      //     Column(
      //       children: [
      //         Align(
      //           alignment: Alignment.topCenter,
      //           child: Padding(
      //             padding: const EdgeInsets.only(top: 200 - 50),
      //             child: Stack(
      //               alignment: Alignment.bottomRight,
      //               children: [
      //                 Container(
      //                   decoration: BoxDecoration(
      //                       border:
      //                           Border.all(color: Colors.deepPurple, width: 2),
      //                       shape: BoxShape.circle),
      //                   child: const CircleAvatar(
      //                     radius: 50,
      //                     backgroundImage:
      //                         AssetImage('images/placeholder_image.png'),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //           child: Column(
      //             children: [
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               Divider(
      //                 color: Colors.deepPurple[100],
      //               ),
      //               const SizedBox(
      //                 height: 4,
      //               ),
      //               ProfileInfoItem(
      //                 icon: Icons.lock,
      //                 label: 'Pengguna',
      //                 value: username,
      //                 iconColor: Colors.amber,
      //               ),
      //               const SizedBox(
      //                 height: 5,
      //               ),
      //               Divider(
      //                 color: Colors.deepPurple[100],
      //               ),
      //               const SizedBox(
      //                 height: 4,
      //               ),
      //               ProfileInfoItem(
      //                   icon: Icons.person,
      //                   label: 'Nama',
      //                   value: fullname,
      //                   // showEditIcon: isSignedIn,
      //                   // onEditPressed: () {
      //                   //   debugPrint('Icon edit ditekan ...');
      //                   // },
      //                   iconColor: Colors.blue),
      //               const SizedBox(
      //                 height: 5,
      //               ),
      //               Divider(
      //                 color: Colors.deepPurple[100],
      //               ),
      //               const SizedBox(
      //                 height: 4,
      //               ),
      //               ProfileInfoItem(
      //                   icon: Icons.favorite,
      //                   label: 'Favorit',
      //                   value:
      //                       favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
      //                   iconColor: Colors.red),
      //               const SizedBox(
      //                 height: 5,
      //               ),
      //               Divider(
      //                 color: Colors.deepPurple[100],
      //               ),
      //               SizedBox(
      //                 height: 20,
      //               ),
      //               isSignedIn
      //                   ? TextButton(
      //                       onPressed: () {},
      //                       child: Text('Sign Out'),
      //                       style: TextButton.styleFrom(
      //                           backgroundColor: Colors.amber,
      //                           padding: const EdgeInsets.all(20),
      //                           elevation: 5),
      //                     )
      //                   : TextButton(
      //                       onPressed: () {},
      //                       child: Text('Sign In'),
      //                       style: TextButton.styleFrom(
      //                           backgroundColor: Colors.amber,
      //                           padding: const EdgeInsets.all(20),
      //                           elevation: 5),
      //                     )
      //             ],
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),

      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,

        title: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Container(
                width: 120,
                height: 120,
                color: Colors.white,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('images/dd.png'),
                ),
              ),
            ),
            SizedBox(height: 22),
            // Menempatkan username di atas
            Text(
              username,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5), // Memberikan jarak antara username dan fullname
            // Menempatkan fullname di bawah
            Text(
              fullname,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 24),

            SizedBox(height: 100), // Memberikan ruang kosong di atas tombol Logout
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
                padding: EdgeInsets.symmetric(horizontal: 170), // Mengatur padding
              ),
              child: Text(
                'SignOut',
                style: TextStyle(
                  color: Colors.black, // Mengatur warna teks menjadi hitam
                  fontWeight: FontWeight.bold, // Mengatur tebal
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
