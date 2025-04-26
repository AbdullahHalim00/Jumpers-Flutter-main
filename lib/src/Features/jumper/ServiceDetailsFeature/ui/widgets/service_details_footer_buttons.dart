part of 'imports_widgets_service_details.dart';

class ServiceDetailsFooterButtons extends StatelessWidget {
  const ServiceDetailsFooterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AcceptJobController>(builder: (_) {
          return Expanded(
            flex: 2,
            child: CustomRoundedButton(
              height: 54.h,
              backgroundColor: AppColors.secondary,
              child: CustomText(
                "accept_job".tr,
                color: AppColors.white,
                fontSize: 12,
              ),
              onPressed: () => _.showAgreementDialog(),
            ),
          );
        }),
        16.0.ESW(),
        GetBuilder<RefuseJobController>(builder: (logic) {
          return Expanded(
            child: CustomOutlinedButton(
              height: 54.h,
              isCurvedBorders: true,
              backgroundColor: AppColors.containerBCGGrey,
              primaryColor: AppColors.transparent,
              child: Center(
                child: CustomText(
                  "refuse".tr,
                  fontSize: 12,
                ),
              ),
              onPressed: () {
                logic.showRejectJobOfferDialog();
              },
            ),
          );
        }),
      ],
    );
  }
}
