import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/repo/fetch_skills_repo.dart';

class FetchSkillsController extends GetxController {
  ///Lists -------------------------------------------------------------

  List<int> _skillIds = [];
  List<String> _skillTitles = [];

  List<int> get skillIds => _skillIds;

  List<String> get skillTitles => _skillTitles;

  void setSelectedSkill(int skillId, String langTitle) {
    if (_skillIds.contains(skillId)) {
      _skillIds.remove(skillId);
      _skillTitles.remove(langTitle);
      update();
    } else {
      _skillIds.add(skillId);
      _skillTitles.add(langTitle);
      update();
    }
    _skillValues = _skillTitles.join(',');
    update();
  }

  void setSetSelectedSkillsIds(List<int> ids, List<String> titles) {
    _skillIds = ids;
    _skillTitles = titles;
    update();
  }

  bool isContain(int id) {
    return _skillIds.contains(id);
  }

  String _skillValues = "";

  String get skillValues => _skillValues;

  /// ----------------------- API CALL ---------------------------------------
  DataState<List<TitleModel>> dataState = const DataInitial<List<TitleModel>>();
  final fetchSkillsRepo = Get.put(FetchSkillsRepository());

  Future<void> fetchSkills() async {
    dataState = const DataLoading<List<TitleModel>>();
    update();

    dataState = (await fetchSkillsRepo.fetchSkills())!;
    update();
  }

  @override
  void onInit() {
    fetchSkills();
    // TODO: implement onInit
    super.onInit();
  }
}
