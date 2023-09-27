import 'package:flutter/material.dart';
import 'package:mume/src/models/folder.dart';
import 'package:mume/src/ui/folder_screen.dart';

class FolderTab extends StatelessWidget {
  FolderTab({super.key});

  final List<FolderModel> folderList = [
    FolderModel(
        folderTitle: 'Top 100 Billboards',
        totalSongs: 100,
        totalDuration: '04:48:25 mins'),
    FolderModel(
        folderTitle: 'My Favorite Songs',
        totalSongs: 240,
        totalDuration: '08:35:18 mins'),
    FolderModel(
        folderTitle: 'Ariana Grande',
        totalSongs: 44,
        totalDuration: '02:12:35 mins'),
    FolderModel(
        folderTitle: 'Most Popular Songs',
        totalSongs: 120,
        totalDuration: '05:22:47 mins'),
    FolderModel(
        folderTitle: 'Childhood Memories',
        totalSongs: 55,
        totalDuration: '03:17:32 mins'),
    FolderModel(
        folderTitle: 'Great Soundtracks',
        totalSongs: 69,
        totalDuration: '04:10:33 mins')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${folderList.length} folders',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Date Added',
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.sort_outlined,
                    color: Colors.orange,
                    size: 18,
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Divider(
            color: Colors.grey[350],
          ),
        ),
        SizedBox(
          height: 700,
          child: ListView.builder(
            itemCount: folderList.length,
            itemBuilder: (context, index) {
              FolderModel folder = folderList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return FolderScreen(folder: folder);
                    },
                  ));
                },
                child: ListTile(
                  leading: const Image(image: AssetImage('assets/folder.png')),
                  title: Text(folder.folderTitle),
                  subtitle: Text('${folder.totalSongs} songs'),
                  trailing: const Icon(
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
    );
  }
}
