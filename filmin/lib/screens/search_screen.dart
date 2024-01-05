// import 'package:flutter/material.dart';
// import 'package:filmin/data/film_data.dart';
// import 'package:filmin/models/film.dart';

import 'package:filmin/data/film_data.dart';
import 'package:filmin/models/film.dart';
import 'package:flutter/material.dart';
import 'package:filmin/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Film> _filterFilms = filmList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _filterFilms = filmList.where((film) {
        final title = film.judul.toLowerCase();
        final language = film.bahasa.toLowerCase();
        return title.contains(_searchQuery.toLowerCase()) ||
            language.contains(_searchQuery.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Pencarian Film"),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: TextField(
                controller: _searchController, // Add this line
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Cari Film ...",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filterFilms.length,
              itemBuilder: (context, index) {
                final film = _filterFilms[index];
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(film: film),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              child: Image.asset(
                                film.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(film.judul,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(film.bahasa,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(film.tanggalRilis,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
