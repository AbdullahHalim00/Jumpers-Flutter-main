part of 'IMPORTS_search_jobtile_employee.dart';

class LatestSearchBuilder extends StatelessWidget {
  const LatestSearchBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchJobTileController>(builder: (_) {
      final search = _.latestSearches;
      return Padding(
        padding: AppInsets.defaultScreenALL,
        child: Column(
          children: [
            Row(
              children: [
                CustomText("latest_search".tr),
                const Spacer(),
                CustomTextButton(
                  child: CustomText(
                    "clear_all".tr,
                    fontSize: 12,
                    fontWeight: FW.regular,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    _.clearAllLatestSearches();
                  },
                ),
              ],
            ),
            21.0.ESH(),
            ConditionalBuilder(
              condition: search.isNotEmpty,
              onBuild: ListView.builder(
                  physics: AppPhysics.neverScrollable,
                  shrinkWrap: true,
                  itemCount: search.length,
                  itemBuilder: (context, index) {
                    final item = search[index];
                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 16.h,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _.onSearchSubmitted(item);
                            },
                            child: SimpleIconLabelTile(
                              label: item,
                              imageUrl: Assets.clock,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              _.removeLatestSearch(item);
                            },
                            child: Image.asset(
                              Assets.close,
                              height: 10.h,
                              width: 10.h,
                              color: AppColors.greyDarker,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              onFeedBack: CustomText.subtitle("لا يوجد عمليات بحث سابقة"),
            ),
          ],
        ),
      );
    });
  }
}
