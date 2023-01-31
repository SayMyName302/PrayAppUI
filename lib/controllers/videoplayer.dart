import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';
export 'videoplayer.dart';
class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
VideoPlayerController?_videoPlayerController;


  ChewieController? _chewieController;
   @override
  void initState(){
    super.initState();
    _videoPlayerController=VideoPlayerController.network('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4');
    try {
      _videoPlayerController!.initialize() .then((_) {
        _chewieController=ChewieController(videoPlayerController: _videoPlayerController!,
         autoPlay: true,
          looping: true,
        );
       setState(() {
          print('Video Player good to go');
       });
      });
    } catch (e) {
      print('Error initializing video player: $e');
    }
  }
  @override
  void dispose(){
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  _chewieVideoPlayer();
    
  }
  Widget _chewieVideoPlayer(){
    return _chewieController!=null && _videoPlayerController!=null?
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Chewie(controller: _chewieController!,),
    ): const Text('Loading!');
  }
}