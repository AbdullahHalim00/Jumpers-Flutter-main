import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/app_socials_model.dart';

class CompanyHelpCenterController extends GetxController {
  /// from AppSocials model
  final List<AppSocialsModel> _socials = AppSocialsData.socialData;

  List<AppSocialsModel> get socialData => _socials;
}
