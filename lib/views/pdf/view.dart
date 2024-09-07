import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/views/pdf/cubit.dart';

class PDFView extends StatelessWidget {
  const PDFView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PDFCubit(),
      child: BlocBuilder<PDFCubit, PDFStates>(
        builder: (context, state) {
          final cubit = PDFCubit.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("PDF"),
            ),
            body: Builder(
              builder: (context) {
                if (state is PDFLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (cubit.pdfDocument == null) {
                  return Center(child: Text('Pick pdf to view'));
                }
                return PDFViewer(
                  document: cubit.pdfDocument!,
                );
              },
            ),
            floatingActionButton: InkWell(
              onTap: cubit.pickPDF,
              child: CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.file_open_sharp,
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
