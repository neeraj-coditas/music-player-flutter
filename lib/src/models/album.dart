class AlbumModel {
  final String albumArt;
  final String artistName;
  final String albumName;
  final int totalSongs;
  final int releaseYear; // Add release year property

  AlbumModel({
    required this.albumArt,
    required this.artistName,
    required this.albumName,
    required this.totalSongs,
    required this.releaseYear,
  });
}
