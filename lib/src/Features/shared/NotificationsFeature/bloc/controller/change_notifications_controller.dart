import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/NotificationsFeature/bloc/repo/change_notifications_status_repo.dart';

class ChangeNotificationsController extends GetxController {
  final GetStorage _box = GetStorage();

  DataState<int> _dataState = const DataInitial<int>();

  DataState<int> get dataState => _dataState;

  ///-------------------------- Fetch Data -------------------------------------

  final ChangeNotificationsStatusRepo _notificationsStatusRepo =
      Get.put(ChangeNotificationsStatusRepo());

  bool _isNotificationOn = false;

  bool get isNotificationOn => _isNotificationOn;

  void _changeStatusView() {
    _isNotificationOn = !_isNotificationOn;
    update();
  }

  void _readLocal() {
    _isNotificationOn = DataBase().restoreUserModel().notifyStatus;
    printDM("Is notification on LOCALLY $_isNotificationOn");
  }

  void _updateUserLocal(int newStatus) {
    UserModel userModel = DataBase().restoreUserModel();
    userModel.notifyStatus = newStatus == 1;
    // final user = DataBase().restoreUserModel().copyWith(notifyStatus:newStatus==1  );
    DataBase().storeUserModel(userModel);
    printDM("NEW MODEL A7a ${DataBase().restoreUserModel().notifyStatus}");
  }

  Future<void> changeStatus() async {
    _changeStatusView();
    _dataState = const DataLoading();
    Utils.showLoadingDialog();
    update();
    _dataState = await _notificationsStatusRepo.changeState()!;
    if (_dataState is DataSuccess) {
      _updateUserLocal(_dataState.data!);
      update();
      Utils.showToast(title: _dataState.message!, state: UtilState.None);
    } else {
      _changeStatusView();
    }
    Utils.closeDialog();
    // Utils.showToast(title: _dataState.error!.errorTitle!, state: UtilState.None);
  }

  @override
  void onInit() {
    printDM("Old Model A7a ${DataBase().restoreUserModel().notifyStatus}");
    _readLocal();
    // TODO: implement onInit
    super.onInit();
  }
}
