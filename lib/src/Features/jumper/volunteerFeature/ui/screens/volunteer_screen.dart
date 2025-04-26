part of 'imports_volunteer.dart';

class VolunteerScreen extends StatelessWidget {
  const VolunteerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(VolunteerController());
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "join_as_a_volunteer".tr,
        isBack: true,
      ),
      scaffoldColor: AppColors.scafBCGBasic,
      body: DefaultContainer(
        hasBorder: false,
        child: GetBuilder<VolunteerController>(
            init: VolunteerController(),
            builder: (_) {
              return RequestStatusBuilder(
                status: _.status,
                onLoading: const LoadingBox(),
                onDone: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      Assets.volunteer_bcg,
                      height: 164.h,
                      width: 342.w,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: AppPhysics.alwaysScrollablePhysics,
                        itemCount: _.data.length,
                        itemBuilder: (context, index) {
                          final item = _.data[index];
                          return StaticTextItem(
                            title: "${item.title}",
                            body: "${item.subtitle}",
                          );
                        },
                      ),
                    ),
                    CustomRoundedButton(
                      backgroundColor: AppColors.secondary,
                      child: CustomText(
                        "apply".tr,
                        fontSize: 14,
                        fontWeight: FW.medium,
                        color: AppColors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
