part of 'empty_imports.dart';

class NoConnectionScreen extends StatelessWidget {
  final VoidCallback? onRedirect;

  const NoConnectionScreen({Key? key, this.onRedirect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "no_connection".tr,
      body: "no_connection_details".tr,
      imageUrl: Assets.no_connection,
      onRedirect: onRedirect ??
          () {
            Get.back();
          },
    );
  }
}
