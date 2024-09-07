import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagesCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Images"),
        ),
        body: BlocBuilder<ImagesCubit, ImagesStates>(
          builder: (context, state) {
            final cubit = ImagesCubit.of(context);
            final images = cubit.images;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final image = images[index];
                          return Dismissible(
                            key: Key(image.path),
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) => cubit.removeImage(image),
                            child: Image.file(image),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(height: 20),
                        itemCount: images.length,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: cubit.pickImage,
                      child: Text('Add Image'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
