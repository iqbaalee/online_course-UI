class ClassModel {
  String? title;
  String? description;
  String? thumbnail;
  int? completePercent;

  ClassModel(
      {this.title, this.description, this.thumbnail, this.completePercent});

  ClassModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    completePercent = json['complete_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['complete_percent'] = completePercent;
    return data;
  }
}
