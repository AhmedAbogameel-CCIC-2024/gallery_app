import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'states.dart';

class ImagesCubit extends Cubit<ImagesStates> {
  ImagesCubit() : super(ImagesInit());

  static ImagesCubit of(context) => BlocProvider.of(context);

  List<File> images = [];

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) {
      return;
    }
    images.insert(0, File(pickedFile.path));
    emit(ImagesInit());
  }

  void removeImage(File value) {
    images.remove(value);
    emit(ImagesInit());
  }
}