class Pages {
  int id;
  String title;
  String itemType;
  int pageId;
  String updatedAt;

  Pages({
    required this.id,
    required this.title,
    required this.itemType,
    required this.pageId,
    required this.updatedAt,
  });

  Pages.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        title = json['title'] ?? '',
        itemType = json['item_type'] ?? '',
        pageId = json['page_id'] ?? 0,
        updatedAt = json['updated_at'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'item_type': itemType,
      'page_id': pageId,
      'updated_at': updatedAt,
    };
  }
}
