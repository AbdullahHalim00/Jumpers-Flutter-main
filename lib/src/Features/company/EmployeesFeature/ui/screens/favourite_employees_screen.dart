part of 'IMPORTS_employees_screen.dart';

class FavoriteEmployeesScreen extends StatelessWidget {
  const FavoriteEmployeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavEmployeesController>(builder: (_) {
      return AndroidOnRefresh(
        onRefresh: () async {
          await _.getMyFavEmployees(); 
        },
        child: CustomListView(
          children: [
            DataStatusBuilder(
              status: _.dataState,
              onDoneBuild: _.dataState is DataSuccess
                  ? ConditionalBuilder(
                      condition: _.dataState.data!.isNotEmpty,

                      /// list is empty => EmptyEmployeesScreen
                      onBuild: FavEmployeeCardBuilder(
                          employees: _.dataState.data ?? []),
                      onFeedBack: Padding(
                        padding: EdgeInsets.only(top: 150.0.h),
                        child: const EmptyFavEmployeeBuilder(),
                      ),

                      /// replace
                    )
                  : 0.0.ESH(),
              onLoadingBuild: const LoadingBox(heightRatio: 0.7),
            ),
          ],
        ),
      );
    });
  }
}
