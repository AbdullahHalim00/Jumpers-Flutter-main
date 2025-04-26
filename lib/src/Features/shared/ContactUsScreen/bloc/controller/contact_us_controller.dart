import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/contact_model.dart';
import 'package:jumper/src/Bloc/models/faq_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/HelpCenterFeature/bloc/repo/faq_repo.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class ContactUsController extends GetxController {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? noteController;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  GlobalKey<FormState> get globalKey => _globalKey;

  DataState<SettingsModel> _serviceDataState =
      const DataInitial<SettingsModel>();

  DataState<SettingsModel> get serviceDataState => _serviceDataState;

  DataState<List<Contract>> _contractDataState =
      const DataInitial<List<Contract>>();

  DataState<List<Contract>> get contractDataState => _contractDataState;

  DataState<ContactUsResponse>? dataState = const DataInitial();

  final FAQRepo _faqRepo = Get.put(FAQRepo());

  /// Fetched data from Api

  Future<void> fetchFAQ() async {
    _serviceDataState = const DataLoading();
    update();
    _serviceDataState = await (_faqRepo.fetchSettingsFAQUs())!;
    update();
  }

  Future<void> fetchContract() async {
    _contractDataState = const DataLoading();
    update();
    _contractDataState = await (_faqRepo.fetchContract())!;
    update();
  }

  sendContactMessage() async {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      dataState = const DataLoading();
      update();
      dataState = await (_faqRepo.sendContactMessage(nameController!.text,
          phoneController!.text, emailController!.text, noteController!.text))!;

      if (dataState!.message.toString() != "") {
        AppSnacks.successMessage(message: 'تم الارسال بنجاح', isToast: true);

        nameController!.clear();
        emailController!.clear();
        phoneController!.clear();
        noteController!.clear();
      }
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFAQ();
    fetchContract();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    noteController?.dispose();
    emailController?.dispose();
    super.dispose();
  }
}
