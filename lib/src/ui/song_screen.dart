import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SongScreen extends StatefulWidget {
  const SongScreen(
      {super.key,
      required this.songImage,
      required this.songName,
      required this.artistName});

  final String songImage;
  final String songName;
  final String artistName;

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late final AudioPlayer audioPlayer;
  late final PlayerState playerState;
  Duration duration = const Duration();
  Duration position = const Duration();
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.play(AssetSource('lessthanzero.mp3'));
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        print(event.toString());
        playerState = event;
      });
    });

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back), // You can use any icon you prefer.
          onPressed: () {
            audioPlayer.stop();
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 24),
              child: Icon(Icons.more_horiz))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: Image(image: NetworkImage(widget.songImage)),
              ),
              const SizedBox(height: 24),
              Text(
                widget.songName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(widget.artistName),
              const SizedBox(height: 24),
              ProgressBar(
                progress: position,
                total: duration,
                thumbColor: Colors.orange,
                progressBarColor: Colors.orange,
                baseBarColor: Colors.grey[300],
                onDragUpdate: (details) {
                  audioPlayer.seek(details.timeStamp);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.skip_previous_rounded,
                    size: 32,
                  ),
                  const Icon(
                    Icons.fast_rewind_rounded,
                    size: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (audioPlayer.state == PlayerState.playing) {
                          audioPlayer.pause();
                        } else if (audioPlayer.state == PlayerState.paused) {
                          audioPlayer.resume();
                        }
                      });
                    },
                    child: Icon(
                      audioPlayer.state == PlayerState.paused
                          ? Icons.play_circle_filled_rounded
                          : audioPlayer.state == PlayerState.playing
                              ? Icons.pause_circle_rounded
                              : Icons.pause_circle_rounded,
                      size: 48,
                      color: Colors.orange,
                    ),
                  ),
                  const Icon(
                    Icons.fast_forward_rounded,
                    size: 32,
                  ),
                  const Icon(
                    Icons.skip_next_rounded,
                    size: 32,
                  )
                ],
              ),
              const Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.speed_rounded,
                        size: 24,
                      ),
                      Icon(
                        Icons.timer_outlined,
                        size: 24,
                      ),
                      Icon(
                        Icons.cast_rounded,
                        size: 24,
                      ),
                      Icon(
                        Icons.more_vert_rounded,
                        size: 24,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Icon(Icons.keyboard_arrow_up_rounded),
                  Text(
                    'Lyrics',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
