part of 'imports_service_details.dart';

class JobAppAcceptedScreen extends StatelessWidget {
  JobAppAcceptedScreen({Key? key}) : super(key: key);

  List<String> title = [
    'تسجيل الحضور',
    'تسجيل الانصراف',
    'الموقع الجغرافي',
    'التقييم',
    'نتمنى لك التوفيق'
  ];
  List<String> descriptions = [
    'یجب ان یتم تسجیل الحضور حال الوصول للموقع , او سیتم￼احتساب تأخیر او غیاب.',
    'یجب ان یتم تسجیل انصراف من الموقع او سیتم احتساب  تأخیر او غیاب.',
    'التحضیر و الانصراف یكون مرتبط بالموقع جغرافیاً , یجب  تفعیل تحدید الموقع من الاعدادات.',
    'ادائك المھام بأفضل شكل یساعد من حصولك على تقییم  عالي و فرص عمل اكثر .',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(FetchAppFeaturesController());
    return DefaultScaffold(
      body: WillPopScope(
        onWillPop: () async {
          Get.offAll(() => const JumperBaseScreen());
          return true;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CustomListView(
                children: [
                  Image.asset(
                    Assets.applicationAccepted,
                    height: 151.h,
                    width: 151.h,
                  ),
                  16.0.ESH(),
                  CustomText(
                    "app_req_accepted".tr,
                    fontSize: 18,
                    fontWeight: FW.semiBold,
                    textAlign: TextAlign.center,
                  ),
                  13.0.ESH(),
                  CustomText.subtitle(
                    "explore_app_services".tr,
                    fontSize: 13,
                    fontWeight: FW.light,
                    textAlign: TextAlign.center,
                  ),
                  25.0.ESH(),
                  GetBuilder<FetchAppFeaturesController>(builder: (logic) {
                    return ListView.builder(
                        physics: AppPhysics.neverScrollable,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          /// هاخد الليست من هنا
                          return AppFeaturesListTile(
                            title: title[index],
                            image: Assets.account_info,
                            description: descriptions[index],
                          );
                        });
                  }),
                ],
              ),
            ),
            32.0.ESH(),
            CustomRoundedButton(
              height: 54.h,
              backgroundColor: AppColors.secondary,
              child: CustomText(
                "back_to_home".tr,
                isUpperCase: true,
                color: Colors.white,
              ),
              onPressed: () {
                // Get.deleteAll();

                Get.offAll(() => const JumperBaseScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
