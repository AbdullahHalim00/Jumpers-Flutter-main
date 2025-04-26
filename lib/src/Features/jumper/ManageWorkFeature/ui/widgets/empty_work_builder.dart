part of 'imports_widgets_manage_work.dart';

class EmptyWorkBuilder extends StatelessWidget {
  const EmptyWorkBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JumperBaseController>(builder: (_) {
      return EmptyPageBuilder(
        title: "empty_work_title".tr,
        body: "empty_work_title_body".tr,
        imageUrl: Assets.empty_work,
        reverseRedirectChildrenOrder: true,
        onRedirect: () {
          Get.back();
          _.changeTabIndex(1);
        },
        redirectLabel: "job_applications".tr,
        redirectImageUrl: Assets.arrow_left,
      );
    });
  }
}
