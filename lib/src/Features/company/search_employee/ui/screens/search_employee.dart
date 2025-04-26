part of 'Imports_search_screen.dart';

class SearchEmployeeScreen extends StatelessWidget {
  const SearchEmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchEmployeeController>(
      init: SearchEmployeeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: AdaptiveSearchBar(
              _.searchController,
              hintLabel: "employee_search".tr,
              onSubmitted: _.onSearchSubmitted,
              onClear: () => _.onCancel(),
              // onChanged: ,
            ),
          ),
          body: Center(
            child: DataStatusBuilder(
              status: _.dataState,
              initialBuild: CustomText.subtitle("look_for_employee"),
              onDoneBuild: ConditionalBuilder(
                condition: _.searchedList!.isNotEmpty,
                // list is not empty for example
                onBuild: SearchEmployeeBodyBuilder(
                  data: _.searchedList!,
                  searchedLetter: _.displayedName ?? "",
                ),
                onFeedBack: const EmptySearchEmployeeBuilder(),
              ),
            ),
          ),
        );
      },
    );
  }
}
