part of 'imports_company_more.dart';

class CompanyMoreScreen extends StatelessWidget {
  const CompanyMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyMoreController());

    final DataBase _dataBase = Get.find();
    return Builder(builder: (context) {
      final user = _dataBase.restoreUserModel();
      return DefaultScaffold(
        padding: EdgeInsets.zero,
        scaffoldColor: AppColors.scafBCGGrey,
        appBar: AppBars.more(
          name: user.name,
          image: user.image,
          address: user.address,
        ),
        body: AnimatedWrapper(
          index: 10,
          child: CustomListView(
            children: [
              // personal info
              MoreSectionLabel(
                label: "personal_info".tr,
              ),
              MoreListTile(
                leadingImage: Assets.account_info,
                title: "account_info".tr,
                onPressed: () {
                  Get.to(
                    () => const MoreInfoScreen(),
                    transition: Transition.fade,
                    duration: AppDurations.mainTransition,
                  );
                },
              ),
              MoreListTile(
                leadingImage: Assets.password,
                title: "password".tr,
                onPressed: () {
                  Get.to(
                    () => const ChangePasswordScreen(),
                    transition: Transition.fade,
                    duration: AppDurations.mainTransition,
                  );
                },
              ),
              MoreListTile(
                leadingImage: Assets.basic_data,
                title: "basic_data".tr,
                onPressed: () {
                  if (_dataBase.restoreUserModel().companyType == 0) {
                    /////////////  companyType==0 => company \\\\\\\\\\\\\\\
                    Get.to(
                      () => const ChangeOrganizationInfo(),
                      transition: Transition.fade,
                      duration: AppDurations.mainTransition,
                    );
                  } else {
                    /////////////  companyType==1 => BusinessOwner \\\\\\\\\\\\\\\
                    Get.to(
                      () => const ChangeBusinessOwnerIfo(),
                      transition: Transition.fade,
                      duration: AppDurations.mainTransition,
                    );
                  }
                },
              ),
              MoreListTile(
                leadingImage: Assets.menu_board,
                title: "my_files".tr,
                onPressed: () {
                  Get.to(const MyFilesScreen());
                },
              ),
              if(user.phone == "999999999")
                MoreListTile(
                  leadingImage: Assets.delete,
                  title: "delete_account".tr,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("حذف الحساب"),
                                const SizedBox(height: 15,),
                                const Text(
                                    "هل أنت متأكد من حذف معلومات حسابك بشكل نهائي , سيتم تطبيق التغييرات بعد 30 يوم من عدم تسجيل الدخول .",
                                textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          DataBase.clearStorage();
                                          Get.offAll(() => const WelcomeScreen());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.redAccent, // background
                                          onPrimary: Colors.white, // foreground
                                        ),
                                        child: const Text("حذف"),
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed:  () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white, // background
                                          onPrimary: Colors.black, // foreground
                                        ),
                                        child: const Text("إلغاء"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            actionsOverflowDirection: VerticalDirection.down,
                          );
                        });
                  },
                ),
              Visibility(
                visible: user.companyType == 0,
                child: MoreListTile(
                  leadingImage: Assets.admin_data,
                  title: "admin_data".tr,
                  onPressed: () {
                    Get.to(
                      () => const ChangeAdminInfo(),
                      transition: Transition.fade,
                      duration: AppDurations.mainTransition,
                    );
                  },
                ),
              ),
              // general settings
              MoreSectionLabel(
                label: "general_settings".tr,
              ),
              MoreListTile(
                leadingImage: Assets.global,
                title: "language".tr,
                onPressed: () {
                  Get.to(
                    () => const LanguageScreen(),
                    transition: Transition.fade,
                    duration: AppDurations.mainTransition,
                  );
                },
              ),
              MoreListTile(
                leadingImage: Assets.notify,
                title: "notifications".tr,
                trailing:
                    GetBuilder<ChangeNotificationsController>(builder: (_) {
                  return AdaptiveSwitch(
                    toolTip: "change_notify_status".tr,
                    initialValue: _.isNotificationOn,
                    onChanged: _.changeStatus,
                  );
                }),
              ),

              // About App
              MoreSectionLabel(
                label: "about_app".tr,
              ),
              MoreListTile(
                leadingImage: Assets.help,
                title: "help_center".tr,
                onPressed: () {
                  Get.to(() => CompanyHelpCenterScreen());
                },
              ),
              MoreListTile(
                leadingImage: Assets.contactUs,
                title: "contact_us".tr,
                onPressed: () {
                  Get.to(() => ContactUsScreen());
                },
              ),
              UnAvailableBuilder(
                child: MoreListTile(
                  leadingImage: Assets.rate,
                  title: "rate_app".tr,
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24.h),
                child: MoreListTile(
                  leadingImage: Assets.logout,
                  title: "sign_out".tr,
                  onPressed: () {
                    DataBase.clearStorage();
                    Get.offAll(() => const WelcomeScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
