import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Core/services/storage/storage_constants.dart';

class JumperBaseController extends GetxController {
  final GetStorage _box = GetStorage();

  late int _tabIndex;

  int get tabIndex => _tabIndex;

  void changeTabIndex(int newIndex) {
    _tabIndex = newIndex;
    _box.write(stgBNBJumperIndex, newIndex);
    update();
  }

  @override
  void onInit() {
    _tabIndex = _box.read(stgBNBJumperIndex) ?? 0;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
