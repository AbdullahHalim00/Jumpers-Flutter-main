part of 'imports_create_new_application.dart';

class CompleteApplicationScreen extends StatefulWidget {
  final bool isEdit;

  const CompleteApplicationScreen({this.isEdit = false, Key? key})
      : super(key: key);

  @override
  State<CompleteApplicationScreen> createState() =>
      _CompleteApplicationScreenState();
}

class _CompleteApplicationScreenState extends State<CompleteApplicationScreen> {
  bool isNumericNum(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    return numericRegex.hasMatch(string);
  }

  @override
  Widget build(BuildContext context) {
    FetchAddJobInfoController _fetchAddJobInfoController =
        Get.put(FetchAddJobInfoController());

    FetchServicesController _fetchServicesController =
        Get.put(FetchServicesController());
    var node = FocusScope.of(context);

    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "CreateAndEditApplicationFeature".tr,
        isBack: true,
      ),
      body: GetBuilder<AddJobController>(
        builder: (_) {
          return Form(
            key: _.formKey2,
            child: AnimatedWrapper(
              index: 10,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: CustomListView(
                      isBouncingScrollPhysics: true,
                      children: [
                        TextFieldDefault(
                          isRequired: true,
                          readOnly: true,
                          suffixIconData: Icons.keyboard_arrow_down,
                          hint: "account_type".tr,
                          hintColor: AppColors.greyPrimary,
                          controller: _.accountTypeController,
                          validation: AppValidator.validate,
                          onTap: () {
                            _fetchAddJobInfoController
                                .setAccountTypeId(_.accountTypeId);
                            _.selectAccountType();
                          },
                          onChanged: (value) {
                            _.calculateTotalCost();
                          },
                        ),
                        24.0.ESH(),
                        TextFieldDefault(
                          isRequired: true,
                          readOnly: true,
                          suffixIconData: Icons.keyboard_arrow_down,
                          hint: "work_type".tr,
                          hintColor: AppColors.greyPrimary,
                          controller: _.workTimeTypeController,
                          validation: AppValidator.validate,
                          onTap: () {
                            _fetchAddJobInfoController
                                .setTimeTypeId(_.workTimeType.value);
                            _.onWorkTimeTypeTapped();
                          },
                        ),
                        if (_.workTimeType.value == 1) ...[
                          24.0.ESH(),
                          TextFieldDefault(
                            readOnly: _.workTimeType.value == 2 ? true : false,
                            isRequired: true,
                            hint: "work_contract_duration".tr,
                            suffixText: "days".tr,
                            keyboardType: TextInputType.number,
                            hintColor: AppColors.greyPrimary,
                            controller: _.workContractDurationController,
                            onComplete: () {
                              _.calcWorkPeriodAuto();
                              node.nextFocus();
                            },
                          ),
                        ],
                        24.0.ESH(),
                        _.workTimeType.value == 1
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFieldDefault(
                                          isRequired: true,
                                          readOnly: true,
                                          hint: "start_date".tr,
                                          hintColor: AppColors.greyPrimary,
                                          controller: _.startDateController,
                                          validation: AppValidator.validate,
                                          onTap: () {
                                            _.pickStartDate();
                                          },
                                        ),
                                      ),
                                      XSpace.titan,
                                      Expanded(
                                        child: TextFieldDefault(
                                          isRequired: true,
                                          readOnly: true,
                                          hint: "end_date".tr,
                                          hintColor: AppColors.greyPrimary,
                                          controller: _.endDateController,
                                          validation: AppValidator.validate,
                                          // onTap: () => _.pickEndDate(),
                                          onChanged: (value) {
                                            _.calculateTotalCost();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  24.ESH(),
                                ],
                              )
                            : _.workTimeType.value == 2
                                ? Column(
                                    children: [
                                      TextFieldDefault(
                                        readOnly: true,
                                        isRequired: true,
                                        suffixIconData:
                                            Icons.keyboard_arrow_down,
                                        hint: "work_times".tr,
                                        hintColor: AppColors.greyPrimary,
                                        controller: _.workTimesController,
                                        validation: AppValidator.validate,
                                        onTap: () => _.openDatePicker(),
                                        onChanged: (value) {
                                          _.calculateTotalCost();
                                        },
                                      ),
                                      24.ESH(),
                                    ],
                                  )
                                : 0.ESW(),
                        if (_.workTimeType.value == 2) ...[
                          TextFieldDefault(
                            readOnly: _.workTimeType.value == 2 ? true : false,
                            isRequired: true,
                            hint: "work_contract_duration".tr,
                            suffixText: "days".tr,
                            keyboardType: TextInputType.number,
                            hintColor: AppColors.greyPrimary,
                            controller: _.workContractDurationController,
                            onComplete: () {
                              _.calcWorkPeriodAuto();
                              node.nextFocus();
                            },
                          ),
                        ],
                        24.0.ESH(),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldDefault(
                                isRequired: true,
                                readOnly: true,
                                suffixIconData: Icons.keyboard_arrow_down,
                                hint: "work_start_time".tr,
                                hintColor: AppColors.greyPrimary,
                                controller: _.workStartTimeController,
                                validation: AppValidator.validate,
                                onTap: () {
                                  _.pickStartTime();
                                },
                              ),
                            ),
                            XSpace.titan,
                            Expanded(
                              child: TextFieldDefault(
                                isRequired: true,
                                readOnly: true,
                                hint: "work_end_time".tr,
                                hintColor: AppColors.greyPrimary,
                                controller: _.workEndTimeController,
                                validation: AppValidator.validate,
                                onComplete: () {
                                  node.nextFocus();
                                },
                                // onTap: () => _.pickEndTime(),
                              ),
                            ),
                          ],
                        ),
                        24.0.ESH(),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextFieldDefault(
                                isRequired: true,
                                keyboardType: TextInputType.number,
                                hint: "assumed_cost".tr,
                                suffixText: "currency".tr,
                                hintColor: AppColors.greyPrimary,
                                controller: _.costController,
                                validation: (value) {
                                  if (value!.isEmpty) {
                                    return "validate_empty_field".tr;
                                    //عفوا لم يتم ادخال كود صحيح
                                  } else {
                                    if (!isNumericNum(value)) {
                                      // must be a num
                                      return "validate_numeric".tr;
                                    } else if (int.parse(value) <
                                            _fetchAddJobInfoController
                                                .accountTypeCost

                                        // _fetchServicesController.services[_fetchServicesController.jobServiceIndexSelected].minimumPrice
                                        ) {
                                      return "الحد الادني لتكلفة هذه الوظيفة هو : ${_fetchAddJobInfoController.accountTypeCost} ريال سعودي";
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                                onComplete: () {
                                  node.nextFocus();
                                },
                                onChanged: (val) {
                                  // print('dsdsdsd');
                                  _.calcTotalCost();
                                },
                              ),
                            ),

                            // XSpace.titan,
                            // Expanded(
                            //   flex: 3,
                            //   child: TextFieldDefault(
                            //     isRequired: true,
                            //     readOnly: true,
                            //     suffixIconData: Icons.keyboard_arrow_down,
                            //     hint: "for_every".tr,
                            //     hintColor: AppColors.greyPrimary,
                            //     controller: _.perCostController,
                            //     onTap: () => _.onPriceTypeTapped(),
                            //   ),
                            // ),
                          ],
                        ),
                        24.0.ESH(),
                        TextFieldDefault(
                          enable: false,
                          isRequired: true,
                          keyboardType: TextInputType.number,
                          hint: "total_assumed_cost".tr,
                          suffixText: "currency".tr,
                          hintColor: AppColors.greyPrimary,
                          controller: _.totalCostController,
                          validation: (value) => AppValidator.validate(value,
                              type: ValidatorType.numeric),
                          onComplete: () {
                            node.nextFocus();
                          },
                        ),
                        24.0.ESH(),
                        TextFieldDefault(
                          maxLines: 3,
                          hint: "job_description".tr,
                          hintColor: AppColors.greyPrimary,
                          controller: _.jobDescriptionController,
                          onComplete: () {
                            node.unfocus();
                          },
                        ),
                        24.0.ESH(),
                        SizedBox(
                          height: 150.h,
                        )
                      ],
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (!widget.isEdit) ...[
                          BottomRequestStatusBuilder(
                            bottomWidget: CustomRoundedButton(
                              height: 54.h,
                              backgroundColor: AppColors.secondary,
                              child: CustomText(
                                "publish_now".tr,
                                color: AppColors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  node.unfocus();
                                  if (_.formKey2.currentState!.validate()) {
                                    _.sendRequest(requestStatus: 0);
                                  }
                                });
                              },
                            ),
                            status: _.dataState!,
                          ),
                          YSpace.hard,
                        ],
                        Visibility(
                          visible: widget.isEdit ? true : false,
                          child: CustomOutlinedButton(
                            primaryColor: AppColors.secondary,
                            height: 54.h,
                            isCurvedBorders: true,
                            child: CustomText(
                              widget.isEdit
                                  ? "edit_request".tr
                                  : "temp_pend_request".tr,
                            ),
                            // isDisabled: _.isButtonDisabled,
                            onPressed: () {
                              node.unfocus();
                              // _.schedulingJob();
                            },
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
