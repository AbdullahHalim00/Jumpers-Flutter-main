import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/repo/fetch_languages_repo.dart';

class FetchLanguagesController extends GetxController {
  List<int> _languageIds = [];
  List<String> _languageTitles = [];

  List<int> get languageIds => _languageIds;

  List<String> get languageTitles => _languageTitles;

  void setSelectedLang(int languageId, String langTitle) {
    if (_languageIds.contains(languageId)) {
      _languageIds.remove(languageId);
      _languageTitles.remove(langTitle);
      update();
    } else {
      _languageIds.add(languageId);
      _languageTitles.add(langTitle);
      update();
    }
    _languageValues = _languageTitles.join(',');
  }

  void setSelectedLangIds(List<int> ids, List<String> titles) {
    _languageIds = ids;
    _languageTitles = titles;
    update();
  }

  bool isContain(int id) {
    printDM("_languageIds.contains(id) is ${_languageIds.contains(id)}");
    return _languageIds.contains(id);
  }

  String _languageValues = "";

  String get languageValues => _languageValues;

  /// ----------------------- API CALL --------------------------
  DataState<List<TitleModel>> _dataState = const DataInitial();

  DataState<List<TitleModel>> get dataState => _dataState;
  final FetchLanguagesRepository _fetchLanguagesRepo =
      Get.put(FetchLanguagesRepository());

  Future<void> fetchLanguages() async {
    _dataState = const DataLoading();

    _dataState = (await _fetchLanguagesRepo.fetchLanguages())!;
    update();
  }

  @override
  void onInit() {
    fetchLanguages();
    // TODO: implement onInit
    super.onInit();
  }
}
