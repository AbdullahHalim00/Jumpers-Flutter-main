part of 'Imports_search_screen.dart';

class SearchJobTileScreen extends StatelessWidget {
  const SearchJobTileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchJobTileController());
    return GetBuilder<SearchJobTileController>(
      // init: SearchJobTileController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: AdaptiveSearchBar(
              _.searchController,
              hintLabel: "search_job_tile".tr,
              onSubmitted: _.onSearchSubmitted,
            ),
          ),
          body: Center(
            child: DataStatusBuilder(
              status: _.dataState,
              initialBuild: LatestSearchBuilder(

                  // savedSearches: [
                  //   "مصمم جرافيك",
                  //   "مصمم جرافيك",
                  // ],
                  ),
              onDoneBuild: ConditionalBuilder(
                condition: _.searchedList!.isNotEmpty,
                // list is not empty for example
                onBuild: SearchJobTileBodyBuilder(jobs: _.searchedList ?? []),
                onFeedBack: const EmptySearchJobTileBuilder(),
              ),
            ),
          ),
        );
      },
    );
  }
}
