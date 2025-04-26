part of 'imports_widgets_service_details.dart';

class ServiceDetailsOrganizationInfoBuilder extends StatelessWidget {
  const ServiceDetailsOrganizationInfoBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyDetailsController>(builder: (_) {
      final company = _.dataState.data;
      return DataStatusBuilder(
        // status:_.dataState,
        status: _.dataState,
        onDoneBuild: _.dataState is! DataSuccess
            ? 0.0.ESH()
            : ConditionalBuilder(
                condition: company != null,
                onBuild: CustomListView(
                  children: [
                    ServiceDetailTile(
                      label: "organisation_name".tr,
                      img: Assets.organisation_name,
                      data: (company?.name != "" ? company?.name : "-"),
                    ),
                    ServiceDetailTile(
                      label: "service_field".tr,
                      img: Assets.organisation_description,
                      data: (company!.services.isNotEmpty
                          ? company.services.join(",")
                          : "-"),
                    ),
                    ServiceDetailTile(
                      label: "address".tr,
                      img: Assets.organisation_address,
                      data: (company.address != "" ? company.address : "-"),
                    ),
                    ServiceDetailTile(
                      label: "work_activity".tr,
                      img: Assets.work_activity,
                      data: (company.workActivityTitle != ""
                          ? company.workActivityTitle
                          : "-"),
                    ),
                    ServiceDetailTile(
                      label: "sector".tr,
                      img: Assets.sector,
                      data: (company.sectorTitle != ""
                          ? company.sectorTitle
                          : "-"),
                    ),
                    Padding(
                      padding: AppInsets.defaultScreenALL,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.header(
                            "organisation_description".tr,
                          ),
                          YSpace.normal,
                          CustomText(
                            (company.about != "" ? company.about : "-"),
                            fontSize: 12,
                            fontWeight: FW.light,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onFeedBack: Center(
                  child: CustomText.subtitle(
                    "no_enough_info_about_organisation".tr,
                  ),
                ),
              ),
      );
    });
  }
}
