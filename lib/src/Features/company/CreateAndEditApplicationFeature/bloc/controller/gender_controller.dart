import 'package:get/get.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/model/gender_model.dart';

class GenderController extends GetxController {
  final int? id;

  GenderController({this.id}) {
    if (id != null) {
      _selectedId = id!;
      update();
    }
  }

  int _selectedId = -1;

  int get selectedId => _selectedId;

  void setSelectedIds(int value) {
    _selectedId = value;
    update();
  }

  String _selectedValue = "";

  String get selectedValue => _selectedValue;

  void setSelectedValue(String value) {
    _selectedValue = value;
    update();
  }

  /// fetch Genders

  final List<GenderModel> _genders = GenderData.genderList;

  List<GenderModel> get genders => _genders;
}
