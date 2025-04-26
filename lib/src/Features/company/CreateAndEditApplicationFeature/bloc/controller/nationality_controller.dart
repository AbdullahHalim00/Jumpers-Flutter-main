import 'package:get/get.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/model/nationality_model.dart';

class NationalityController extends GetxController {
  final int? id;

  NationalityController({this.id}) {
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

  /// fetch nationalities

  final List<NationalityModel> _nationalities = NationalityData.nationalities;

  List<NationalityModel> get nationalities => _nationalities;
}
