part of 'imports_widgets_home_screen.dart';

/// api call
class CompanyStatisticCard extends StatelessWidget {
  final String label;
  final String labelDescription;

  final int requestNumber;

  final Color color;

  final String imgUrl;

  const CompanyStatisticCard({
    Key? key,
    required this.label,
    required this.labelDescription,
    required this.requestNumber,
    required this.color,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      isCurvedBorders: true,
      padding: AppInsets.defaultScreenALL,
      borderColor: AppColors.cardBorderDarker,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 21.r,
            backgroundColor: color,
            child: Image.asset(
              imgUrl,
              scale: 4,
            ),
          ),
          XSpace.normal,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  label,
                  fontSize: 9.sp,
                ),
                YSpace.light,
                CustomText(
                  requestNumber == 0
                      ? "not_yet".tr
                      : "${requestNumber.adN}" "   " + (labelDescription),
                  // fontSize: 15.sp,
                  fontSize: requestNumber == 0 ? 9.sp : 15.sp,
                  fontWeight: FW.semiBold,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// "single_employee".tr
