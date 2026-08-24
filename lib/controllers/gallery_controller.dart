import 'package:flutter/material.dart';
import 'package:flutter_application_gallery_app/models/image_models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryController extends ChangeNotifier {
  List<ImageModels> images = [];
  final ImagePicker picker = ImagePicker();
  Future<void> pickFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      images.add(ImageModels(imagePath: image.path));
      await saveImages();
      notifyListeners();
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      images.add(ImageModels(imagePath: image.path));
      await saveImages();
      notifyListeners();
    }
  }

  Future<void> saveImages() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> paths = images.map((image) => image.imagePath).toList();

    await prefs.setStringList("saved_images", paths);
  }

  Future<void> loadImages() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> paths = prefs.getStringList("saved_images") ?? [];

    images.clear();

    for (final path in paths) {
      images.add(ImageModels(imagePath: path));
    }
    notifyListeners();
  }

  Future<void> deleteImage(int index) async {
    images.removeAt(index);
    await saveImages();
    notifyListeners();
  }
}
