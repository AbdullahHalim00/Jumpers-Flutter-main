import 'package:jumper/src/Core/constants/strings/assets.dart';

class AppSocialsModel {
  final int id;

  final String label;

  final String asset;

  final String? backgroundColor;

  final String? link;

  AppSocialsModel._(
      {required this.id,
      required this.label,
      required this.asset,
      this.backgroundColor,
      this.link});
}

class AppSocialsData {
  static final List<AppSocialsModel> _list = [
    AppSocialsModel._(
      id: 1,
      label: "Facebook",
      asset: Assets.saudiFlag,
      backgroundColor: "0xffE7F1FE",
      link: "https://enjoy.crazyideaco.com/ar",
    ),
    AppSocialsModel._(
      id: 2,
      label: "Instagram",
      asset: Assets.saudiFlag,
      backgroundColor: "0xffFFF5E5",
      link: "https://enjoy.crazyideaco.com/ar",
    ),
    AppSocialsModel._(
      id: 3,
      label: "Youtube",
      asset: Assets.saudiFlag,
      backgroundColor: "0xffFFEBEB",
      link: "https://enjoy.crazyideaco.com/ar",
    ),
    AppSocialsModel._(
      id: 4,
      label: "Twitter",
      asset: Assets.saudiFlag,
      backgroundColor: "0xffE5F6FE",
      link: "https://enjoy.crazyideaco.com/ar",
    ),
    AppSocialsModel._(
      id: 5,
      label: "Share",
      asset: Assets.saudiFlag,
      backgroundColor: "0xffE9EAEC",
      link: "https://enjoy.crazyideaco.com/ar",
    ),
  ];

  static List<AppSocialsModel> get socialData => _list;
}
