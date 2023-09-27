import 'package:flutter/material.dart';
import 'package:mume/src/models/folder.dart';
import 'package:mume/src/models/song.dart';

class FolderScreen extends StatelessWidget {
  FolderScreen({super.key, required this.folder});

  final FolderModel folder;

  final List<SongModel> songs = [
    SongModel(
        songName: "Shape of You",
        artistName: "Ed Sheeran",
        artistArt:
            "https://static.independent.co.uk/s3fs-public/thumbnails/image/2014/12/05/18/Ed-Sheeran.jpg",
        albumArt:
            "https://upload.wikimedia.org/wikipedia/en/b/b4/Shape_Of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png",
        duration: "2:55"),
    SongModel(
        songName: "Blinding Lights",
        artistName: "The Weeknd",
        artistArt:
            "https://thefader-res.cloudinary.com/private_images/w_760,c_limit,f_auto,q_auto:best/the-weeknd-name-change-abel-Tesfaye_yyfhyl/the-weeknd-photo-by-brian-ziff.jpg",
        albumArt:
            "https://upload.wikimedia.org/wikipedia/en/e/e6/The_Weeknd_-_Blinding_Lights.png",
        duration: "3:35"),
    SongModel(
        songName: "Uptown Funk",
        artistName: "Bruno Mars",
        artistArt:
            "https://lastfm.freetls.fastly.net/i/u/ar0/7253d5bd01c230ed133e235ead33d64b.jpg",
        albumArt:
            "https://i.scdn.co/image/ab67616d0000b273e419ccba0baa8bd3f3d7abf2",
        duration: "4:12"),
    SongModel(
        songName: "Bohemian Rhapsody",
        artistName: "Queen",
        artistArt:
            "https://www.japantimes.co.jp/uploads/imported_images/uploads/2019/01/p11-stmichel-wideangle-a-20190201.jpg",
        albumArt:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1ZsX7hIWSaqhUA4uDoD3EdwAX22fqSi1oZPfNPVebcxHs1DkNlTjPE3yrh4EKzDBooGI&usqp=CAU",
        duration: "3:29"),
    SongModel(
        songName: "LuCoZaDe",
        artistName: "Zayn",
        artistArt:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZBlmWVft_RAAs2LNl5WLpM1e4RH7Ch-Vq91eLa5LLikxJSHlkUj_eCi3GLs6JO8w1WI&usqp=CAU",
        albumArt:
            "https://m.media-amazon.com/images/I/81aqwOlV+LL._UF1000,1000_QL80_.jpg",
        duration: "2:45")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.search,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              Icons.menu,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Container(
              alignment: Alignment.center,
              height: 200,
              child: const Image(
                height: 200,
                image: AssetImage('assets/folder.png'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                folder.folderTitle,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${folder.totalSongs} songs  |  ${folder.totalDuration}',
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))))),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.shuffle,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Shuffle',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        iconColor:
                            const MaterialStatePropertyAll(Colors.orange),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange[100]),
                        shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))))),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.play_circle),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Play',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey[400],
              height: 2,
            ),
            const Column(
              children: [
                SizedBox(height: 20),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Songs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  SongModel song = songs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(song.albumArt),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(song.songName),
                              Text(song.artistName)
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.orange,
                                ),
                              ),
                              Icon(Icons.more_vert)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
