import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/utils/extensions.dart';

import '../../../../../Core/constants/colors/app_colors.dart';
import '../../../../../Core/constants/decorations/app_physics.dart';
import '../../../../../Core/constants/strings/assets.dart';
import '../../../../../Ui/buttons/custom_rounded_button.dart';
import '../../../../../Ui/listview/custom_listview.dart';
import '../../../../../Ui/scaffold/default_scaffold.dart';
import '../../../../../Ui/text/custom_text.dart';
import '../../../../jumper/ServiceDetailsFeature/ui/widgets/imports_widgets_service_details.dart';
import '../../../base/ui/screens/imports_company_base_screen.dart';

class JobAppPaymentScreen extends StatelessWidget {
  JobAppPaymentScreen({Key? key}) : super(key: key);

  List<String> title = [
    'تابع مشروعك',
    'تابع حضور و انصراف الفريق',
    'انشىء قائمة موظفينك المفضلة',
    'تواصل معنا'
  ];

  List<String> descriptions = [
    'من خلال صفحة الطلبات الجاريه \n*تواصل مع افراد فريقك *\nمن خلال صفحة الدردشه اللي تتيح لك المحادثات الفرديه او المحادثة مع المجموعة',
    'عملية الحضور و الانصراف مرتبطة بالموقع المحدد من قبلكم ، لكن بامكانك متابعة الحضور و الانصراف من خلال صفحة سجل النشاطات الموجودة في خانة الموظفين.',
    'بامكانك اضافة اي موظف لقائمة المفضله ، و بذلك يصبح بإمكانك الاستفادة من خدماتهم مره اخرى.',
    'بامكانك التواصل معنا بعد انتهاء المشروع ، لرفع اي ملاحظه او غياب و تاخير و فريقنا سيقوم باللازم.',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: WillPopScope(
        onWillPop: () async {
          Get.offAll(() => const CompanyBaseScreen());
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
                    "payment_success".tr,
                    fontSize: 18,
                    fontWeight: FW.semiBold,
                    textAlign: TextAlign.center,
                  ),
                  25.0.ESH(),
                  ListView.builder(
                      physics: AppPhysics.neverScrollable,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        /// هاخد الليست من هنا
                        return AppFeaturesListTile(
                          title: title[index],
                          image: Assets.account_info,
                          description: descriptions[index],
                        );
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
                Get.offAll(CompanyBaseScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
