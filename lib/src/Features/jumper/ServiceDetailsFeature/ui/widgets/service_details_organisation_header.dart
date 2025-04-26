part of 'imports_widgets_service_details.dart';

class ServiceDetailsHeader extends StatelessWidget {
  final String? jobTitle;
  final String? salary;
  final String? serviceImage;
  final String? workType;
  final String? address;
  final String? workPlace;

  const ServiceDetailsHeader({
    Key? key,
    this.serviceImage,
    this.jobTitle,
    this.salary,
    this.workType,
    this.address,
    this.workPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// image
        ConditionalBuilder(
          condition: serviceImage != "",
          onBuild: CircleAvatar(
            radius: 54.r,
            backgroundColor: AppColors.circleAvatarDarker,
            backgroundImage: NetworkImage("$serviceImage"),
          ),
          onFeedBack: CircleAvatar(
            radius: 54.r,
            backgroundColor: AppColors.circleAvatarDarker,
            backgroundImage: const AssetImage(Assets.defaultUser),
          ),
        ),
        11.0.ESH(),
        CustomText(
          jobTitle ?? "",
          fontWeight: FW.semiBold,
          textAlign: TextAlign.center,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          // maxLines: 3,
        ),
        12.0.ESH(),
        CustomText.subtitle(
          salary ?? "",
          fontWeight: FW.regular,
          fontSize: 14,
        ),
        16.0.ESH(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (workType != "")
                Expanded(
                    child: _ContainedLabel(
                  label: "$workType",
                )),
              if (address != "")
                Expanded(
                    flex: 2,
                    child: _ContainedLabel(
                      label: "$address",
                    )),
              if (workPlace != "")
                Expanded(
                    child: _ContainedLabel(
                  label: "$workPlace",
                )),
            ],
          ),
        ),
        33.0.ESH(),
        // SizedBox(
        //   height: 30.h,
        //   child: ListView(
        //     physics: AppPhysics.neverScrollable,
        //     scrollDirection: Axis.horizontal,
        //     children: [
        //       if (workType != "")
        //         _ContainedLabel(
        //           label: "$workType",
        //         ),
        //       if (address != "")
        //         _ContainedLabel(
        //           label: "$address",
        //         ),
        //       if (workPlace != "")
        //         _ContainedLabel(
        //           label: "$workPlace",
        //         ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class _ContainedLabel extends StatelessWidget {
  final String? label;

  const _ContainedLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 4.w,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      hasBorder: true,
      child: Tooltip(
        message: label,
        child: Center(
          child: CustomText.subtitle(
            label ?? "",
            fontWeight: FW.light,
            fontSize: 10,
            isOverFlow: true,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
