// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImageModels {
  String imagePath;
  ImageModels({
    required this.imagePath,
  });

  ImageModels copyWith({
    String? imagePath,
  }) {
    return ImageModels(
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
    };
  }

  factory ImageModels.fromMap(Map<String, dynamic> map) {
    return ImageModels(
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModels.fromJson(String source) => ImageModels.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ImageModels(imagePath: $imagePath)';

  @override
  bool operator ==(covariant ImageModels other) {
    if (identical(this, other)) return true;
  
    return 
      other.imagePath == imagePath;
  }

  @override
  int get hashCode => imagePath.hashCode;
}
