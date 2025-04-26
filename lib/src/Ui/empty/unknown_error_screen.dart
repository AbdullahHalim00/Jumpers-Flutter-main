part of 'empty_imports.dart';

class UnKnownErrorScreen extends StatelessWidget {
  final VoidCallback? onRedirect;

  const UnKnownErrorScreen({Key? key, this.onRedirect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "there_is_unKnown_exception".tr,
      body: "something_went_wrong_details".tr,
      imageUrl: Assets.no_connection,
      onRedirect: onRedirect ??
          () {
            Get.back();
          },
    );
  }
}
