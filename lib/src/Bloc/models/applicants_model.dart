class ApplicantsModel {
  late int id;

  late String name;

  late String image;

//<editor-fold desc="Data Methods">

  ApplicantsModel({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApplicantsModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          image == other.image);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'ApplicantsModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' image: $image,' +
        '}';
  }

  ApplicantsModel copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return ApplicantsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory ApplicantsModel.fromMap(Map<String, dynamic> map) {
    return ApplicantsModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
