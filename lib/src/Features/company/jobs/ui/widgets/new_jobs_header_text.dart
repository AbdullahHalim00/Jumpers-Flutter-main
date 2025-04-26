part of 'imports_widgets_job_screen.dart';

class NewJobsHeaderText extends StatelessWidget {
  const NewJobsHeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
        color: AppColors.containerBCGGrey,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outlined,
            size: 15.r,
          ),
          XSpace.normal,
          Expanded(
              child: CustomText.subtitle(
            "new_jobs_info".tr,
            fontSize: 11,
          )),
        ],
      ),
    );
  }
}
