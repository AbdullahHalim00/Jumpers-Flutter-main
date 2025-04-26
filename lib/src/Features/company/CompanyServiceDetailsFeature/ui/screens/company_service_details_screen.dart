part of 'imports_company_service_details.dart';

class CompanyServiceDetailsScreen extends StatelessWidget {
  final CompanyJobModel job;

  const CompanyServiceDetailsScreen({Key? key, required this.job})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyServiceDetailsController());
    return DefaultScaffold(
      // scaffoldColor: AppColors.scafBCGGrey,
      appBar: AppBars.basic(
        title: "job_description".tr,
        isBack: true,
        actions: [
          JobDetailsOptions(
            job: job,
          ),
        ],
      ),
      body: CompanyServiceDetailsBuilder(
        service: job,
      ),
    );
  }
}
