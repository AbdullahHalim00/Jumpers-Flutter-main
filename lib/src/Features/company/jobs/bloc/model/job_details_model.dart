// import 'package:jumper/src/Ui/cards/job_application_card.dart';
//
// class JobDetailsModel {
//   ApplicationCardStatus? status;
//
//   String? jobTitle;
//
//   int? salary;
//
//   String? address;
//
//   String? workType;
//
//   String? contractPeriod;
//
//   String? workTime;
//
//   String? publishedAt;
//
//   List<ApplicantData>? applicants = [];
//
//   JobDetailsModel({
//     this.status,
//     this.jobTitle,
//     this.salary,
//     this.address,
//     this.workType,
//     this.contractPeriod,
//     this.workTime,
//     this.publishedAt,
//     this.applicants,
//   });
//
//   factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
//       JobDetailsModel(
//         status: json["state_index"] != null
//             ? cardStatus(json["state_index"])
//             : cardStatus(3),
//         jobTitle: json["job_title"] ?? "",
//         salary: json["salary"] ?? "",
//         address: json["address"] ?? "",
//         workType: json["work_type"] ?? "",
//         contractPeriod: json["contract_period"] ?? "",
//         workTime: json["work_time"] ?? "",
//         publishedAt: json["published_at"] ?? "",
//         applicants: List<ApplicantData>.from(
//             json["applicants"].map((x) => ApplicantData.fromJson(x))),
//       );
// }
//
// class ApplicantData {
//   ApplicantData({
//     this.id,
//     this.name,
//     this.image,
//   });
//
//   int? id;
//   String? name;
//   String? image;
//
//   factory ApplicantData.fromJson(Map<String, dynamic> json) => ApplicantData(
//         id: json["id"] ?? 0,
//         name: json["name"] ?? "",
//         image: json["image"] ?? "",
//       );
// }
//
// // ApplicationCardStatus cardStatus(int index) {
// //   if (index == 0) {
// //     return ApplicationCardStatus.newRequest;
// //   } else if (index == 1) {
// //     return ApplicationCardStatus.reviewing;
// //   } else if (index == 2) {
// //     return ApplicationCardStatus.pending;
// //   } else if (index == 3) {
// //     return ApplicationCardStatus.underWay;
// //   } else if (index == 4) {
// //     return ApplicationCardStatus.completed;
// //   } else {
// //     return ApplicationCardStatus.canceled;
// //   }
// // }
