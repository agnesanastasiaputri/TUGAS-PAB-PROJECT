class Film {
  final String judul;
  final String url;
  final String sinopsis;
  final String director;
  final String penulis;
  final String tanggalRilis;
  final String bahasa;
  final String negara;
  final String imageAsset;
  final double rating;
  final int favorite;
  final Map<String, String> castImageUrls;
  // final List<String> imageUrls;
  bool isFavorite;

  Film({
    required this.judul,
    required this.url,
    required this.sinopsis,
    required this.director,
    required this.penulis,
    required this.tanggalRilis,
    required this.bahasa,
    required this.negara,
    required this.imageAsset,
    required this.rating,
    required this.favorite,
    required this.castImageUrls,
    // required this.imageUrls,
    required this.isFavorite, 
  });

}
