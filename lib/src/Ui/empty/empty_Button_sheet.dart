part of 'empty_imports.dart';

class EmptyButtonSheetScreen extends StatelessWidget {
  const EmptyButtonSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "no_data".tr,
      imageUrl: "assets/images/empty_data.png",
      // body: "empty_messages_body".tr,
      reverseRedirectChildrenOrder: true,
    );
  }
}
