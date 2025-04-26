import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';

class AddJopInfoModel {
  AddJopInfoModel({
    required this.status,
    required this.message,
    required this.accountTypes,
    required this.workDurations,
    required this.timeTypes,
    required this.priceTypes,
  });

  late final bool status;
  late final String message;
  late final List<TitleModel> accountTypes;
  late final List<SimpleModel> workDurations;
  late final List<SimpleModel> timeTypes;
  late final List<SimpleModel> priceTypes;

  AddJopInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    message = json['message'] ?? "Error in model";
    if (json['account_types'] != null) {
      accountTypes = List.from(json['account_types'])
          .map((e) => TitleModel.fromJson(e))
          .toList();
    }
    if (json['work_durations'] != null) {
      workDurations = List.from(json['work_durations'])
          .map((e) => SimpleModel.fromJson(e))
          .toList();
    }
    if (json['time_types'] != null) {
      timeTypes = List.from(json['time_types'])
          .map((e) => SimpleModel.fromJson(e))
          .toList();
    }
    if (json['price_types'] != null) {
      priceTypes = List.from(json['price_types'])
          .map((e) => SimpleModel.fromJson(e))
          .toList();
    }
  }
}
