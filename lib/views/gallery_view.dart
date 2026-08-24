import 'package:flutter/material.dart';
import 'package:flutter_application_gallery_app/controllers/gallery_controller.dart';
import 'package:flutter_application_gallery_app/widgets/image_grid.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {

  final controller = GalleryController();

  @override
  void initState() {
    super.initState();
    controller.loadImages();
  }

  @override
  Widget build(BuildContext context) {
    
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) => Scaffold(
        appBar: AppBar(title: Text("My Gallery"),centerTitle: true,),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ImageGrid(images: controller.images,onDelete: (index) => controller.deleteImage(index),),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.camera),
                        title: Text("Camera"),
                        onTap: () => controller.pickFromCamera(),
                      ),
                      ListTile(
                        leading: Icon(Icons.image),
                        title: Text("Gallery"),
                        onTap: () => controller.pickFromGallery(),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}
