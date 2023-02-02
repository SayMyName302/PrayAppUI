import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';

import 'package:rxdart/rxdart.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class sleepPage extends StatefulWidget {
  const sleepPage({super.key});

  @override
  State<sleepPage> createState() => _sleepPageState();
}

class _sleepPageState extends State<sleepPage> {
  late AudioPlayer _audioPlayer;
  final _playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(
        Uri.parse(
            'https://media.blubrry.com/muslim_central_quran/podcasts.qurancentral.com/aaar-al-hudhoudi/112.mp3'),
        tag: MediaItem(
            id: '0',
            title: 'Surah Ikhlaas',
            artist: 'Aar Al Hudhoudi',
            artUri: Uri.parse(
              'https://freeislamiccalligraphy.com/wp-content/uploads/2013/06/Surat-al-Ikhlas-112-Circular-scaled.jpg',
            )
            )
            ),
    AudioSource.uri(// naas
        Uri.parse(
            'https://media.blubrry.com/muslim_central_quran/podcasts.qurancentral.com/aaar-al-hudhoudi/114.mp3'),
                tag: MediaItem(
            id: '0',
            title: 'Surah Naas',
            artist: 'Aar Al Hudhoudi',
            artUri: Uri.parse(
              'https://www.shutterstock.com/image-illustration/arabic-calligraphy-surah-naas-chapter-600w-1598025295.jpg',
            )
            )
            
            ),
    AudioSource.uri(//kaafiron
        Uri.parse(
            'https://media.blubrry.com/muslim_central_quran/podcasts.qurancentral.com/aaar-al-hudhoudi/109.mp3'),
            
                tag: MediaItem(
            id: '0',
            title: 'Surah Kafiroon',
            artist: 'Aar Al Hudhoudi',
            artUri: Uri.parse(
              'http://cdn.shopify.com/s/files/1/0560/5824/9239/products/12_5586298b-d1ee-4ffb-8a35-75c5841702c9.jpg',
            )
            )
            ),
    AudioSource.uri(//falak
        Uri.parse(
            'https://media.blubrry.com/muslim_central_quran/podcasts.qurancentral.com/aaar-al-hudhoudi/113.mp3'),
            
                tag: MediaItem(
            id: '0',
            title: 'Surah Falak',
            artist: 'Aar Al Hudhoudi',
            artUri: Uri.parse(
              'https://thumbs.dreamstime.com/z/islamic-calligraphy-them-quran-surah-al-falaq-dawn-ayah-registration-muslim-holidays-135836726.jpg',
            )
            )
            
            ),
  ]);

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playlist);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF144771), Color(0xFF071A2C)],
          )),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            StreamBuilder<SequenceState?>(
              stream: _audioPlayer.sequenceStateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state?.sequence.isEmpty ?? true) {
                  return const SizedBox();
                }

                final metadata = state!.currentSource!.tag as MediaItem;
                return MediaMetadata(
                  imageUrl: metadata.artUri.toString(),
                  artist: metadata.artist ?? '',
                  title: metadata.title,
                );
              },
            ), // StreamBuilder129

            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return ProgressBar(
                  barHeight: 8,
                  baseBarColor: Colors.grey[600],
                  bufferedBarColor: Colors.grey,
                  progressBarColor: Colors.red,
                  thumbColor: Colors.red,
                  timeLabelTextStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  progress: positionData?.position ?? Duration.zero,
                  buffered: positionData?.bufferedPosition ?? Duration.zero,
                  total: positionData?.duration ?? Duration.zero,
                  onSeek: _audioPlayer.seek,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Controls(
              audioPlayer: _audioPlayer,
            )
          ]),
        ));
  }
}

class MediaMetadata extends StatelessWidget {
  const MediaMetadata({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2, 4),
                blurRadius: 4,
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
                imageUrl: imageUrl, height: 300, width: 300, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ), // TextStyle
          textAlign: TextAlign.center,
        ), // Text
        const SizedBox(height: 8),
        Text(
          artist,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ), // TextStyle
          textAlign: TextAlign.center,
        ), // Text
      ],
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: audioPlayer.seekToPrevious,
            iconSize: 60,
            color: Colors.white,
            icon: const Icon(Icons.skip_previous_rounded
            )
            
            ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: audioPlayer.play,
                iconSize: 80,
                color: Colors.white,
                icon: const Icon(Icons.play_arrow_rounded),
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: audioPlayer.pause,
                iconSize: 80,
                color: Colors.white,
                icon: const Icon(Icons.pause_rounded),
              );
            }
            return const Icon(
              Icons.play_arrow_rounded,
              size: 80,
              color: Colors.white,
            );
          },
        ),
          IconButton(
            onPressed: audioPlayer.seekToNext,
            iconSize: 60,
            color: Colors.white,
            icon: const Icon(Icons.skip_next_rounded
            )
            
            ),
      ],
    );
  }
}
