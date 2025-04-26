part of 'empty_imports.dart';

class SomethingWrongScreen extends StatelessWidget {
  final VoidCallback? onRedirect;

  final bool hideAppBar;

  const SomethingWrongScreen(
      {Key? key, this.onRedirect, this.hideAppBar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      // hideAppBar: hideAppBar,
      title: "something_went_wrong".tr,
      body: "something_went_wrong_details".tr,
      imageUrl: Assets.something_wrong,
      onRedirect: onRedirect ?? () => Get.back(),
    );
  }
}
