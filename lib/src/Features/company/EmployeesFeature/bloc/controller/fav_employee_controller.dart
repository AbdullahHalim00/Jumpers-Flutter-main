import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/controller/my_fav_employees_controller.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/repo/fav_employee_repo.dart';

class FavEmployeeController extends GetxController {
  /// -------------- API CALLS --------------
  final FavEmployeeApiRepo _favEmployeeApiRepo = Get.put(FavEmployeeApiRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool?> changeFav(
    int employeeID,
  ) async {
    Utils.showLoadingDialog();
    bool? isFavourite = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_favEmployeeApiRepo.fav(employeeID: employeeID)) ?? DataFailed<bool>(ErrorModel());
    Get.back();
    isFavourite = _dataState.data;
    update();
    if(isFavourite != null){
      _onFavChangedSuccess(isFavourite, message: _dataState.message ?? "");
    }
    return isFavourite;
  }

  Future<void> _onFavChangedSuccess(bool isFavourite,
      {required String message}) async {
    Utils.showDefaultSnackBar(title: message);
    if (isFavourite) {
      MyFavEmployeesController myFavEmployeesController = Get.find();
      await myFavEmployeesController.getMyFavEmployees();
    }
  }

//
// void  _checkFaveEmployee (bool isFave,int jobID,){
//     if(isFaved){
//       // AppSnacks.addToFav(isToast: true);
//       final MyEmployeesController myEmployeesController = Get.find();
//       myEmployeesController.getMyEmployees();
//       // delete from model
//     }
//     else {
//       AppSnacks.requestError(isToast: true);
//     }
//   }
}
