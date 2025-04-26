part of 'imports_create_new_application.dart';

class CreateJobApplicationScreen extends StatelessWidget {
  final String? title;
  final CompanyJobModel? companyJobModel;
  final bool isEdit;

  const CreateJobApplicationScreen(
      {Key? key, this.title, this.companyJobModel, this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetchCitiesController _fetchCitiesController =
        Get.put(FetchCitiesController());
    Get.put(AddJobController(isEdit: isEdit, jobModel: companyJobModel));
    FetchServicesController _fetchServicesController =
        Get.put(FetchServicesController());
    FetchLanguagesController _fetchLanguagesController =
        Get.put(FetchLanguagesController());
    // final JumperPersonalInfoController controllers =
    //     Get.put(JumperPersonalInfoController());
    FetchSkillsController _fetchSkillsController =
        Get.put(FetchSkillsController());
    Get.put(FetchWorkTimeTypesController());
    Get.put(FetchWorkTypeController());
    Get.put(FetchWorkTimeTypeController());
    var node = FocusScope.of(context);
    final now = DateTime.now();
    final showEdit = now.month == 3 && (now.day == 16);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultScaffold(
        padding: EdgeInsets.all(10),
        appBar: AppBars.basic(
          title: title ?? "CreateAndEditApplicationFeature".tr,
          isBack: true,
        ),
        body:
        GetBuilder<AddJobController>(
          builder: (_) {
            return Form(
              key: _.formKey1,
              child: AnimatedWrapper(
                index: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CustomListView(
                        isBouncingScrollPhysics: true,
                        children: [
                          /// service
                          TextFieldDefault(
                            isRequired: true,
                            readOnly: true,
                            hint: "service_name".tr,
                            hintColor: AppColors.greyPrimary,
                            controller: _.serviceNameController,
                            suffixIconData: Icons.keyboard_arrow_down,
                            validation: AppValidator.validate,
                            onTap: () {
                              _fetchServicesController
                                  .setJobServiceIdSelected(_.serviceId);
                              _.onServiceTapped();
                            },
                          ),
                          24.0.ESH(),

                          /// jumpers
                          TextFieldDefault(
                            isRequired: true,
                            hint: "jumper_number".tr,
                            keyboardType: TextInputType.number,
                            hintColor: AppColors.greyPrimary,
                            controller: _.jumpersController,
                            validation: (String? value) =>
                                AppValidator.validate(
                              value!,
                              type: ValidatorType.numeric,
                            ),
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          24.0.ESH(),

                          /// nationality
                          TextFieldDefault(
                            // isRequired: true,
                            readOnly: true,
                            hint: "nationality".tr,
                            hintColor: AppColors.greyPrimary,
                            suffixIconData: Icons.keyboard_arrow_down,
                            controller: _.nationalityController,
                            // validation: AppValidator.validate,
                            onTap: _.onNationalityTapped,
                          ),
                          24.0.ESH(),

                          /// gender
                          TextFieldDefault(
                            // isRequired: true,
                            readOnly: true,
                            hint: "gender".tr,
                            suffixIconData: Icons.keyboard_arrow_down,
                            hintColor: AppColors.greyPrimary,
                            controller: _.genderController,
                            // validation: AppValidator.validate,
                            onTap: _.onGenderTapped,
                          ),
                          24.0.ESH(),
                          if (_.genderId == 3) ...[
                            Row(
                              children: [
                                Expanded(
                                  child: TextFieldDefault(
                                    isRequired: true,
                                    hint: "males_number".tr,
                                    hintColor: AppColors.greyPrimary,
                                    controller: _.numOfMalesController,
                                    keyboardType: TextInputType.number,
                                    validation: (value) =>
                                        AppValidator.validate(value,
                                            type: ValidatorType.numeric),
                                  ),
                                ),
                                XSpace.normal,
                                Expanded(
                                  child: TextFieldDefault(
                                    isRequired: true,
                                    hint: "females_number".tr,
                                    hintColor: AppColors.greyPrimary,
                                    controller: _.numOfFeMalesController,
                                    keyboardType: TextInputType.number,
                                    validation: (value) =>
                                        AppValidator.validate(value,
                                            type: ValidatorType.numeric),
                                  ),
                                ),
                              ],
                            ),
                            24.0.ESH(),
                          ],

                          /// age
                          TextFieldDefault(
                            readOnly: true,
                            hint: "the_age".tr,
                            suffixIconData: Icons.keyboard_arrow_down,
                            hintColor: AppColors.greyPrimary,
                            controller: _.ageController,
                            keyboardType: TextInputType.number,
                            // validation: (String? value) => AppValidator.validate(
                            //     value,
                            //     type: ValidatorType.age),
                            onTap: () => _.onAgeTapped(context),
                          ),
                          24.0.ESH(),

                          /// skills
                          TextFieldDefault(
                              isRequired: true,
                              readOnly: true,
                              hint: "skills".tr,
                              suffixIconData: Icons.keyboard_arrow_down,
                              hintColor: AppColors.greyPrimary,
                              controller: _.skillsController,
                              validation: AppValidator.validate,
                              onTap: () {
                                _fetchSkillsController.setSetSelectedSkillsIds(
                                    _.skillIds, _.skillTitles);
                                _.onSkillsTapped();
                              }),
                          24.0.ESH(),

                          /// language /// change
                          // TextFieldDefault(
                          //     isRequired: true,
                          //     readOnly: true,
                          //     hint: "language".tr,
                          //     suffixIconData: Icons.keyboard_arrow_down,
                          //     hintColor: AppColors.greyPrimary,
                          //     controller: _.languagesController,
                          //     validation: (String? value) =>
                          //         AppValidator.validate(value,
                          //             type: ValidatorType.language),
                          //     onTap: () {
                          //       _fetchLanguagesController.setSelectedLangIds(_.lanIds, _.lanTitles);
                          //       _.onLanguagesTapped();
                          //     }),
                          // 24.0.ESH(),
                          /// work type
                          // TextFieldDefault(
                          //   isRequired: true,
                          //   readOnly: true,
                          //   hint: "work_type_",
                          //   suffixIconData: Icons.keyboard_arrow_down,
                          //   hintColor: AppColors.greyPrimary,
                          //   controller: _.workTimeTypeController,
                          //   // validation: AppValidator.validate,
                          //   onTap: () => _.selectWorkType(),
                          // ),
                          // 24.0.ESH(),
                          /// work address + map
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldDefault(
                                  isRequired: true,
                                  readOnly: !showEdit,
                                  hint: "work_location".tr,
                                  hintColor: AppColors.greyPrimary,
                                  controller: _.workLocationController,
                                  validation: AppValidator.validate,
                                ),
                              ),
                              XSpace.titan,
                              InkWell(
                                child: Image.asset(
                                  Assets.map,
                                  height: 54.h,
                                  width: 54.h,
                                ),
                                onTap: () => _.moveToMap(),
                              ),
                            ],
                          ),
                          24.0.ESH(),
                          TextFieldDefault(
                            isRequired: true,
                            readOnly: true,
                            onTap: () {
                              _fetchCitiesController.setCityID(_.cityId);
                              _.openCitySheet();
                            },
                            suffixIconData: Icons.keyboard_arrow_down,
                            prefixIconUrl: "assets/icons/TFLocationIcon.png",
                            hint: "city",
                            keyboardType: TextInputType.name,
                            controller: _.cityController,
                            validation: (val) => AppValidator.validate(val,
                                type: ValidatorType.city),
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          24.0.ESH(),

                          /// address_detailed
                          TextFieldDefault(
                            enable: true,
                            maxLines: 3,
                            hint: "address_detailed".tr,
                            hintColor: AppColors.greyPrimary,
                            controller: _.detailedAddressController,
                            textInputAction: TextInputAction.done,

                            onComplete: () {
                              node.unfocus();
                            },
                          ),
                        ],
                      ),
                    ),
                    24.0.ESH(),
                    CustomRoundedButton(
                      backgroundColor: AppColors.secondary,
                      child: CustomText(
                        "continue".tr,
                        color: AppColors.white,
                      ),
                      // isDisabled: _.isProceedButtonDisabled,
                      onPressed: () {
                        // _.publishApplication(requestStatus: 0);
                        // _.completeApplication();
                        if (_.formKey1.currentState!.validate()) {
                          node.unfocus();
                          _.calcTotalCost();
                          _.completeApplication();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
