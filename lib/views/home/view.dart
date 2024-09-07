import 'package:flutter/material.dart';
import 'package:gallery_app/views/images/view.dart';
import 'package:gallery_app/views/pdf/view.dart';
import 'package:gallery_app/views/video/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImagesView())),
              child: Text('Images'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoView())),
              child: Text('Video'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PDFView())),
              child: Text('PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
