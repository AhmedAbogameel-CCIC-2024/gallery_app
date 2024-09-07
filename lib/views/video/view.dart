import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/views/video/cubit.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatelessWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit(),
      child: BlocBuilder<VideoCubit, VideoStates>(
        builder: (context, state) {
          final cubit = VideoCubit.of(context);
          final controller = cubit.controller;
          return Scaffold(
            appBar: AppBar(
              title: Text("Video"),
            ),
            body: Builder(
              builder: (context) {
                if (state is VideoLoading || (controller?.value.isBuffering ?? false)) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller == null) {
                  return Center(
                    child: Text('Pick video to play'),
                  );
                }
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: cubit.playOrPause,
                          icon: CircleAvatar(
                            child: Icon(
                              controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: InkWell(
              onTap: cubit.pickVideo,
              child: CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.video_library,
                  size: 28,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
