import 'package:flutter/material.dart';
import 'package:mume/src/models/artist.dart';

class ArtistTab extends StatelessWidget {
  ArtistTab({super.key});

  final List<ArtistModel> artistList = [
    ArtistModel(
      artistName: "Ed Sheeran",
      artistArt:
          "https://static.independent.co.uk/s3fs-public/thumbnails/image/2014/12/05/18/Ed-Sheeran.jpg",
      totalSongs: "23",
      totalAlbums: "4",
    ),
    ArtistModel(
      artistName: "The Weeknd",
      artistArt:
          "https://thefader-res.cloudinary.com/private_images/w_760,c_limit,f_auto,q_auto:best/the-weeknd-name-change-abel-Tesfaye_yyfhyl/the-weeknd-photo-by-brian-ziff.jpg",
      totalSongs: "18",
      totalAlbums: "2",
    ),
    ArtistModel(
      artistName: "Bruno Mars",
      artistArt:
          "https://lastfm.freetls.fastly.net/i/u/ar0/7253d5bd01c230ed133e235ead33d64b.jpg",
      totalSongs: "27",
      totalAlbums: "5",
    ),
    ArtistModel(
      artistName: "Queen",
      artistArt:
          "https://www.japantimes.co.jp/uploads/imported_images/uploads/2019/01/p11-stmichel-wideangle-a-20190201.jpg",
      totalSongs: "45",
      totalAlbums: "6",
    ),
    ArtistModel(
      artistName: "Zayn",
      artistArt:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZBlmWVft_RAAs2LNl5WLpM1e4RH7Ch-Vq91eLa5LLikxJSHlkUj_eCi3GLs6JO8w1WI&usqp=CAU",
      totalSongs: "39",
      totalAlbums: "3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  '${artistList.length} artists',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              height: 2,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 600,
            child: ListView.builder(
              itemCount: artistList.length,
              itemBuilder: (context, index) {
                final artist = artistList[index];
                return ListTile(
                  leading: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(artist.artistArt)),
                  title: Text(
                    artist.artistName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Songs: ${artist.totalSongs}  |  Albums: ${artist.totalAlbums}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 4,
                                          width: 48,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 70,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        artist.artistArt),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      artist.artistName,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '${artist.totalAlbums}  |  ${artist.totalSongs} mins',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[700],
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(Icons.favorite_border)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Divider(
                                        height: 2,
                                        color: Colors.grey[250],
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons
                                              .play_circle_outline_rounded),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 12.0),
                                            child: Text('Play'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons
                                              .arrow_circle_right_outlined),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 12.0),
                                            child: Text('Play Next'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.list_alt_rounded),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 12.0),
                                            child: Text('Add to Playing Queue'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.add_box_outlined),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 12.0),
                                            child: Text('Add to Playlist'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.send_rounded),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 12.0),
                                            child: Text('Share'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
