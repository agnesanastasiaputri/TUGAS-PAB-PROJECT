class Film {
  final String judul;
  final String sinopsis;
  final String director;
  final String penulis;
  final String tanggalRilis;
  final String bahasa;
  final String negara;
  final String imageAsset;
  final List<String> imageUrls;
  bool isFavorite;

  Film({
    required this.judul,
    required this.sinopsis,
    required this.director,
    required this.penulis,
    required this.tanggalRilis,
    required this.bahasa,
    required this.negara,
    required this.imageAsset,
    required this.imageUrls,
    this.isFavorite = false,
  });
}
