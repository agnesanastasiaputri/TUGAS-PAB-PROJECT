import 'package:filmin/models/film.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  final List<Film> selectedFilm;
  const SelectScreen({Key ? key, required this.selectedFilm}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}