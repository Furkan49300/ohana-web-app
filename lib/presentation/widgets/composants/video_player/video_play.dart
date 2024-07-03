import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DirectVideoAtom extends StatefulWidget {
  const DirectVideoAtom({super.key});

  @override
  State<DirectVideoAtom> createState() => _VideoAtomState();
}

class _VideoAtomState extends State<DirectVideoAtom> {
  late VideoPlayerController _VideoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    intPlayer();
  }

  intPlayer() async {
    _VideoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    ));
    await _VideoPlayerController.initialize().then((value) => setState(() {}));
    _chewieController = ChewieController(
        videoPlayerController: _VideoPlayerController,
        aspectRatio: _VideoPlayerController.value.aspectRatio,
        autoPlay: true,
        looping: true);
  }

  @override
  void dispose() {
    super.dispose();
    _VideoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }
}
