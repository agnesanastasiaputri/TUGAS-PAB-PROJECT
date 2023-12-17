import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:filmin/models/film.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatefulWidget {
  final Film film;
  const DetailScreen({Key? key, required this.film}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // final videoURL = 'https://youtu.be/NxW_X4kzeus?si=QU5d_AgEuOrwcWg_';

  late YoutubePlayerController _controller;
  // bool isPlaying = false;

  bool isFavorite = false;
  bool isSignedIn = false;

  @override
  void initState() {
    // final videoID = YoutubePlayer.convertUrlToId(videoURL);

_controller = YoutubePlayerController(
    initialVideoId: '${widget.film.url}',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );
    // _controller = YoutubePlayerController(
    //   initialVideoId: videoID!,
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: true,
    //   ),
    // )..addListener(() {
    //     if (isPlaying != _controller.value.isPlaying) {
    //       setState(() {
    //         isPlaying = _controller.value.isPlaying;
    //       });
    //     }
    //   });

    super.initState();
    _checkSignInStatus();
    _loadFavoriteStatus();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
void listener(){
  print('Status pemutar video berubah: ${_controller.value.playerState}');
}

  // void _togglePlaying() {
  //   setState(() {
  //     if (isPlaying) {
  //       _controller.pause();
  //     } else {
  //       _controller.play();
  //     }
  //     isPlaying = !isPlaying;
  //   });
  // }

  // Memeriksa status sign in
  void _checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool signedIn = prefs.getBool('isSignedIn') ?? false;
    setState(() {
      isSignedIn = signedIn;
    });
  }

  // Memeriksa status favorit
  void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool favorite = prefs.getBool('favorite_${widget.film.judul}') ?? false;
    setState(() {
      isFavorite = favorite;
    });
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Memeriksa apakah pengguna sudah sign in
    if (isSignedIn) {
      // Jika belum sign in, arahkan ke SignInScreen
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Navigator.pushReplacementNamed(context, '/signin');
      });
      return;
    }

    bool favoriteStatus = !isFavorite;
    prefs.setBool('favorite_${widget.film.judul}', favoriteStatus);

    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 17, 17),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DetailHeader
            Stack(
              children: [
                // image utama
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image.asset(
                        widget.film.imageAsset,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // DetailInfo
            // YoutubePlayer(
            //   controller: _controller,
            //   showVideoProgressIndicator: true,
            //   progressIndicatorColor: Colors.red,
            // ),
            YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: () {
                _controller.addListener(listener);
              },
            ),
            builder: (context, player) {
              return player;
            },
          ),
            // Center(
            //   child: IconButton(
            //     icon: Icon(
            //      isPlaying ? Icons.pause : Icons.play_arrow,
            //      color: Colors.white,
            //      size: 48,
            //     ),
            //     onPressed: _togglePlaying,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  // info atas (nama candi dan tombol favorit
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Judul',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.film.judul}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Director',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.film.director}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Writer',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.film.penulis}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Release Date',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.film.tanggalRilis}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Language',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.film.bahasa}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.film.negara}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // info bawah (deskripsi)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sinopsis',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      widget.film.sinopsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Cast',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.film.castImageUrls.length,
                      itemBuilder: (context, index) {
                        final actorName =
                            widget.film.castImageUrls.keys.toList()[index];
                        final actorImageUrl =
                            widget.film.castImageUrls.values.toList()[index];

                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(48),
                                  child: CachedNetworkImage(
                                    imageUrl: actorImageUrl,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      width: 150,
                                      height: 150,
                                      color: Colors.white,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                actorName,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

            // DetailGallery
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Text(
//                       'Cast',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   // SizedBox(
//                   //   height: 100,
//                   //   child: ListView.builder(
//                   //     scrollDirection: Axis.horizontal,
//                   //     itemCount: widget.film.imageUrls.length,
//                   //     itemBuilder: (context, index) {
//                   //       return Padding(
//                   //         padding: const EdgeInsets.only(right: 8),
//                   //         child: GestureDetector(
//                   //           onTap: () {},
//                   //           child: Container(
//                   //             decoration: BoxDecoration(
//                   //               borderRadius: BorderRadius.circular(50),
//                   //               border: Border.all(
//                   //                 color: Colors.white,
//                   //                 width: 2,
//                   //               ),
//                   //             ),
//                   //             child: ClipRRect(
//                   //               borderRadius: BorderRadius.circular(10),
//                   //               child: CachedNetworkImage(
//                   //                 imageUrl: widget.film.imageUrls[index],
//                   //                 width: 120,
//                   //                 height: 120,
//                   //                 fit: BoxFit.cover,
//                   //                 placeholder: (context, url) => Container(
//                   //                   width: 150,
//                   //                   height: 150,
//                   //                   color: Colors.white,
//                   //                 ),
//                   //                 errorWidget: (context, url, error) =>
//                   //                     const Icon(Icons.error),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       );
//                   //     },
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 160, // Adjust the height based on your preference
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: widget.film.castImageUrls.length,
//                       itemBuilder: (context, index) {
//                         final actorName =
//                             widget.film.castImageUrls.keys.toList()[index];
//                         final actorImageUrl =
//                             widget.film.castImageUrls.values.toList()[index];

//                         return Padding(
//                           padding: const EdgeInsets.only(right: 8),
//                           child: Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   border: Border.all(
//                                     color: Colors.white,
//                                     width: 2,
//                                   ),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: CachedNetworkImage(
//                                     imageUrl: actorImageUrl,
//                                     width: 120,
//                                     height: 120,
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) => Container(
//                                       width: 150,
//                                       height: 150,
//                                       color: Colors.white,
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         const Icon(Icons.error),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 actorName,
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }