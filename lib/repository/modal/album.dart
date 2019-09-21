import 'dart:convert';

List<AlbumImage> albumImageFromJson(String str) => List<AlbumImage>.from(json.decode(str).map((x) => AlbumImage.fromJson(x)));

String albumImageToJson(List<AlbumImage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumImage {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  AlbumImage({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory AlbumImage.fromJson(Map<String, dynamic> json) => AlbumImage(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
