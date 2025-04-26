// class OrganisationModel {
// late String name;
// late String about;
// late String address;
// late String work_activity;
// late String sector;
// late String description;
//
// //<editor-fold desc="Data Methods">
//
//   OrganisationModel({
//     required this.name,
//     required this.about,
//     required this.address,
//     required this.work_activity,
//     required this.sector,
//     required this.description,
//   });
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is OrganisationModel &&
//           runtimeType == other.runtimeType &&
//           name == other.name &&
//           about == other.about &&
//           address == other.address &&
//           work_activity == other.work_activity &&
//           sector == other.sector &&
//           description == other.description);
//
//   @override
//   int get hashCode =>
//       name.hashCode ^
//       about.hashCode ^
//       address.hashCode ^
//       work_activity.hashCode ^
//       sector.hashCode ^
//       description.hashCode;
//
//   @override
//   String toString() {
//     return 'OrganisationModel{' +
//         ' name: $name,' +
//         ' about: $about,' +
//         ' address: $address,' +
//         ' work_activity: $work_activity,' +
//         ' sector: $sector,' +
//         ' description: $description,' +
//         '}';
//   }
//
//   OrganisationModel copyWith({
//     String? name,
//     String? about,
//     String? address,
//     String? work_activity,
//     String? sector,
//     String? description,
//   }) {
//     return OrganisationModel(
//       name: name ?? this.name,
//       about: about ?? this.about,
//       address: address ?? this.address,
//       work_activity: work_activity ?? this.work_activity,
//       sector: sector ?? this.sector,
//       description: description ?? this.description,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'name': this.name,
//       'about': this.about,
//       'address': this.address,
//       'work_activity': this.work_activity,
//       'sector': this.sector,
//       'description': this.description,
//     };
//   }
//
//   factory OrganisationModel.fromMap(Map<String, dynamic> map) {
//     return OrganisationModel(
//       name: map['name'] ??"",
//       about: map['about'] ??"",
//       address: map['address'] ??"",
//       work_activity: map['work_activity'] ??"",
//       sector: map['sector'] ??"",
//       description: map['description'] ??"",
//     );
//   }
//
//
// }
