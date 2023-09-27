import 'package:flutter/material.dart';
import 'package:mume/src/models/album.dart';

class AlbumTab extends StatelessWidget {
  AlbumTab({super.key});

  final List<AlbumModel> albumList = [
    AlbumModel(
      albumArt:
          "https://static.independent.co.uk/s3fs-public/thumbnails/image/2014/12/05/18/Ed-Sheeran.jpg",
      artistName: "Ed Sheeran",
      albumName: "Divide",
      totalSongs: 28, // Total songs by Ed Sheeran
      releaseYear: 2023, // Set the release year based on your data
    ),
    AlbumModel(
      albumArt:
          "https://thefader-res.cloudinary.com/private_images/w_760,c_limit,f_auto,q_auto:best/the-weeknd-name-change-abel-Tesfaye_yyfhyl/the-weeknd-photo-by-brian-ziff.jpg",
      artistName: "The Weeknd",
      albumName: "Dawn FM",
      totalSongs: 42, // Total songs by The Weeknd
      releaseYear: 2023, // Set the release year based on your data
    ),
    AlbumModel(
      albumArt:
          "https://lastfm.freetls.fastly.net/i/u/ar0/7253d5bd01c230ed133e235ead33d64b.jpg",
      artistName: "Bruno Mars",
      albumName: "Uptown Funk",
      totalSongs: 13, // Total songs by Bruno Mars
      releaseYear: 2023, // Set the release year based on your data
    ),
    AlbumModel(
      albumArt:
          "https://www.japantimes.co.jp/uploads/imported_images/uploads/2019/01/p11-stmichel-wideangle-a-20190201.jpg",
      artistName: "Queen",
      albumName: "Queen II",
      totalSongs: 45, // Total songs by Queen
      releaseYear: 2023, // Set the release year based on your data
    ),
    AlbumModel(
      albumArt:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZBlmWVft_RAAs2LNl5WLpM1e4RH7Ch-Vq91eLa5LLikxJSHlkUj_eCi3GLs6JO8w1WI&usqp=CAU",
      artistName: "Zayn",
      albumName: "Mind of Mine",
      totalSongs: 27, // Total songs by Zayn
      releaseYear: 2023, // Set the release year based on your data
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${albumList.length} albums',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Colors.grey[350],
            ),
          ),
          SizedBox(
            height: 800,
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: (0.68),
              ),
              itemCount: albumList.length,
              itemBuilder: (context, index) {
                final album = albumList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        elevation: 2.0,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          child: Image.network(
                            album.albumArt,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          album.albumName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        const Icon(
                          Icons.more_vert,
                          size: 20,
                        )
                      ],
                    ),
                    Text(
                      '${album.artistName}  |  ${album.releaseYear}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text('${album.totalSongs} songs',
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 12)),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
