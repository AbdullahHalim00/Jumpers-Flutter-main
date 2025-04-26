// class ServiceModel {
//   List<ServiceData> ?data =[];
//
//   ServiceModel({this.data});
//   factory ServiceModel.fromJson(Map<String, dynamic> json) {
//     return ServiceModel(
//       data: List<ServiceData>.from(json["data"].map((x) => x)),
//     );
//   }
// }
//
// class ServiceData {
//   int ?id;
//   String ?title;
//   double ?price;
//
//
//   ServiceData({this.id, this.title,this.price });
//
//
//   factory ServiceData.fromJson(Map<String, dynamic> json) {
//     return ServiceData(
//       id: json['id'] ??0,
//       title: json['title']??"",
//       price: json['price']??0,
//     );
//   }
// }
