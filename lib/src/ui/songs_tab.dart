import 'package:flutter/material.dart';
import 'package:mume/src/models/song.dart';

class SongsTab extends StatefulWidget {
  const SongsTab({super.key, required this.songs});

  final List<SongModel> songs;

  @override
  State<SongsTab> createState() => _SongsTabState();
}

class _SongsTabState extends State<SongsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.songs.length} songs',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: widget.songs.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                SongModel song = widget.songs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 50,
                    child: GestureDetector(
                      onLongPress: () {
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
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          song.albumArt),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        song.songName,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        '${song.artistName}  |  ${song.duration} mins',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[700],
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
                                                .arrow_circle_right_outlined),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Text('Play Next'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.list_alt_rounded),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child:
                                                  Text('Add to Playing Queue'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
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
                                          height: 12,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons
                                                .play_circle_outline_rounded),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Text('Go to Album'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.person_2_outlined),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Text('Go to Artist'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.info_outlined),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Text('Details'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.call),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Text('Set as Ringtone'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons
                                                .cancel_presentation_rounded),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Text('Add to Blacklist'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
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
                                          height: 12,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.delete_outline_rounded),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0),
                                              child: Text('Delete from Device'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(song.albumArt),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      song.songName,
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "${song.artistName}    |    ${song.duration}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
