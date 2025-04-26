part of "imports_account.dart";

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final AccountController _accountController = Get.find<AccountController>();
    return GetBuilder<AccountController>(builder: (_) {
      return DefaultScaffold(
        padding: EdgeInsets.zero,
        scaffoldColor: AppColors.scafBCGGrey,
        appBar: AppBars.more(
          name: _.getUser.name,
          image: _.getUser.image,
          address: _.getUser.address,
        ),
        body: AndroidOnRefresh(
          onRefresh: () async {
            // await _dataBase.fetchUser();
            // return Future.value(true);
          },
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
                leadingImage: Assets.personal_data,
                title: "personal_data".tr,
                onPressed: () {
                  Get.to(
                    () => const JumperInfoScreen(isEdit: true),
                    transition: Transition.fade,
                    duration: AppDurations.mainTransition,
                  );
                },
              ),
              MoreListTile(
                leadingImage: Assets.skills,
                title: "my_skills".tr,
                onPressed: () {
                  Get.to(
                    () => const EmploymentInfoScreen(isEdit: true),
                    transition: Transition.fade,
                    duration: AppDurations.mainTransition,
                  );
                },
              ),

              MoreListTile(
                leadingImage: Assets.transaction,
                title: "bank_account_settings".tr,
                onPressed: () {
                  Get.to(
                    () => const BankAccountSettingScreen(),
                    transition: Transition.fade,
                    duration: AppDurations.mainTransition,
                  );
                },
              ),

              MoreListTile(
                leadingImage: Assets.wallet,
                title: "wallet".tr,
                onPressed: () {
                  Get.to(
                    () => const WalletScreen(),
                    transition: Transition.fade,
                    duration: AppDurations.mainTransition,
                  );
                },
              ),
              MoreListTile(
                leadingImage: Assets.menu_board,
                title: "my_files".tr,
                onPressed: () {
                  Get.to(const MyFilesScreen());
                },
              ),
              if(_.getUser.phone == "565642556")
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

              UnAvailableBuilder(
                child: MoreListTile(
                  leadingImage: Assets.setting,
                  title: "advanced_options".tr,
                  onPressed: () {
                    Get.to(() => const AdvancedOptionsFeature());
                  },
                ),
              ),
              // About App
              MoreSectionLabel(
                label: "around_app".tr,
              ),
              UnAvailableBuilder(
                child: MoreListTile(
                  leadingImage: Assets.medal,
                  title: "join_as_a_volunteer".tr,
                  onPressed: () {
                    Get.to(() => const VolunteerScreen());
                  },
                ),
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
                    DataBase.clearStorage().then((_) {
                      Get.offAll(() => const WelcomeScreen());
                    });
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
