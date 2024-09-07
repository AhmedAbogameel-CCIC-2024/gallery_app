import 'dart:io';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

part 'states.dart';

class VideoCubit extends Cubit<VideoStates> {
  VideoCubit() : super(VideoInit());

  static VideoCubit of(context) => BlocProvider.of(context);

  VideoPlayerController? controller;

  Future<void> pickVideo() async {
    emit(VideoLoading());
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo == null) {
      emit(VideoInit());
      return;
    }
    final file = File(pickedVideo.path);
    await _initVideoPlayer(file);
    emit(VideoInit());
  }

  Future<void> _initVideoPlayer(File file) async {
    controller = VideoPlayerController.file(file);
    await controller?.initialize();
    controller?.play();
  }

  void playOrPause() {
    if (controller!.value.isPlaying) {
      controller?.pause();
    } else {
      controller?.play();
    }
    emit(VideoInit());
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}