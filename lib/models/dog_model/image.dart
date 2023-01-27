// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Image {
  String id;
  int width;
  int height;
  String url;
  Image({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });
  

  Image copyWith({
    String? id,
    int? width,
    int? height,
    String? url,
  }) {
    return Image(
      id: id ?? this.id,
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'width': width,
      'height': height,
      'url': url,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      id: map['id'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Image(id: $id, width: $width, height: $height, url: $url)';
  }

  @override
  bool operator ==(covariant Image other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.width == width &&
      other.height == height &&
      other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      width.hashCode ^
      height.hashCode ^
      url.hashCode;
  }
}
