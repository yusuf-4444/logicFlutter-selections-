import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoUpload extends StatefulWidget {
  const VideoUpload({super.key});

  @override
  State<VideoUpload> createState() => _VideoUploadState();
}

class _VideoUploadState extends State<VideoUpload> {
  VideoPlayerController? _controller;

  Future<void> _uploadVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedVideo != null) {
      _controller = VideoPlayerController.file(File(pickedVideo.path));
      await _controller!.initialize();
      setState(() {});

      await _controller!.play();
      _controller!.setLooping(true);
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 150,
              width: 300,
              child: _controller != null
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                    )
                  : SizedBox.shrink(),
            ),

            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                _uploadVideo();
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Upload Video",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
