import '../../home/data/manga_model.dart';

class LicensedMangaModel {
  int? id;
  String? title;
  String? author;
  String? note;
  String? parody;
  String? tier;
  int? pages;
  SiteTag? siteTag;
  String? image;
  String? uuid;
  List<String>? tags;
  String? link;

  LicensedMangaModel({
    this.id,
    this.title,
    this.author,
    this.note,
    this.parody,
    this.tier,
    this.pages,
    this.siteTag,
    this.image,
    this.uuid,
    this.tags,
    this.link,
  });

  factory LicensedMangaModel.fromJson(Map<String, dynamic> json) {
    return LicensedMangaModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      note: json['note'],
      parody: json['parody'],
      tier: json['tier'],
      pages: json['pages'],
      siteTag:
          json['siteTags'] != null ? SiteTag.fromJson(json['siteTags']) : null,
      image: json['image'],
      uuid: json['uuid'],
      tags: List<String>.from(json['tag'] ?? []),
      link: json['link'],
    );
  }
}
