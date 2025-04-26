class SimpleModel {
  late int id;
  late String title;

//<editor-fold desc="Data Methods">

  SimpleModel({
    required this.id,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SimpleModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title);

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'SimpleModel{ id: $id, title: $title,}';
  }

  SimpleModel copyWith({
    int? id,
    String? title,
  }) {
    return SimpleModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory SimpleModel.fromJson(Map<String, dynamic> map) {
    return SimpleModel(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

//</editor-fold>
}
