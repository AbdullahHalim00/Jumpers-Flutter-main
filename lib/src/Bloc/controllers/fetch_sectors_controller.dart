import 'package:get/get.dart';
import 'package:jumper/src/Bloc/Data/Repository/fetch_sectors_repo.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';

class FetchSectorsController extends GetxController {
  int _sectorID = 0;

  int get sectorID => _sectorID;

  void setSectorID(int value) {
    _sectorID = value;
    update();
  }

  String _sectorTitle = '';

  String get sectorTitle => _sectorTitle;

  void setSectorTitle(String value) {
    _sectorTitle = value;
    update();
  }

  DataState<List<SimpleModel>>? _dataState = const DataInitial();

  DataState<List<SimpleModel>>? get dataState => _dataState;
  final FetchSectorsRepository _fetchSectorsRepository =
      Get.put(FetchSectorsRepository());

  Future<void> fetchSectors() async {
    _dataState = const DataLoading();
    update();
    _dataState = await _fetchSectorsRepository.fetchSectors();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchSectors();
    super.onInit();
  }
}
