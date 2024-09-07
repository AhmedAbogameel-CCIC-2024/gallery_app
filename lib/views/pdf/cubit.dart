import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class PDFCubit extends Cubit<PDFStates> {
  PDFCubit() : super(PDFInit());

  static PDFCubit of(context) => BlocProvider.of(context);

  PDFDocument? pdfDocument;

  Future<void> pickPDF() async {
    emit(PDFLoading());
    final pickedFile  = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', "PDF"],
    );
    if (pickedFile?.files.isEmpty ?? true) {
      emit(PDFInit());
      return;
    }
    final file = File(pickedFile!.files.first.path!);
    pdfDocument = await PDFDocument.fromFile(file);
    emit(PDFInit());
  }
}