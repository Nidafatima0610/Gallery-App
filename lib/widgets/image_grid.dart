import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_gallery_app/models/image_models.dart';

class ImageGrid extends StatelessWidget {
  final List<ImageModels> images;
  final void Function(int index) onDelete;

  const ImageGrid({super.key, required this.images, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Delete Image?"),
                content: Text("Are you sure you want to delete this image?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      onDelete(index);
                      Navigator.pop(context);
                    },
                    child: Text("Delete"),
                  ),
                ],
              );
            },
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.file(File(images[index].imagePath), fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
