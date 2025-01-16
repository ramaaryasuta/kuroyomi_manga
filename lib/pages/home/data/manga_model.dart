class MangaModel {
  int? id;
  String? hm;
  String? nh;
  String? eh;
  String? im;
  String? title;
  String? author;
  String? note;
  String? parody;
  String? tier;
  int? pages;
  // String? misc;
  SiteTag? siteTag;
  String? image;
  String? uuid;
  List<String>? tag;
  String? link;

  MangaModel({
    this.id,
    this.hm,
    this.nh,
    this.eh,
    this.im,
    this.title,
    this.author,
    this.note,
    this.parody,
    this.tier,
    this.pages,
    // this.misc,
    this.siteTag,
    this.image,
    this.uuid,
    this.tag,
    this.link,
  });

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    return MangaModel(
      id: json['id'],
      hm: json['hm'],
      nh: json['nh'],
      eh: json['eh'],
      im: json['im'],
      title: json['title'],
      author: json['author'],
      note: json['note'],
      parody: json['parody'],
      tier: json['tier'],
      pages: json['pages'],
      // misc: json['misc'],
      siteTag:
          json['siteTags'] != null ? SiteTag.fromJson(json['siteTags']) : null,
      image: json['image'],
      uuid: json['uuid'],
      tag: List<String>.from(json['tags'] ?? []),
      link: json['link'],
    );
  }
}

class SiteTag {
  List<String>? tags;
  List<String>? characters;

  SiteTag({this.tags, this.characters});

  factory SiteTag.fromJson(Map<String, dynamic> json) {
    return SiteTag(
      tags: List<String>.from(json['tags'] ?? []),
      characters: List<String>.from(json['characters'] ?? []),
    );
  }
}
