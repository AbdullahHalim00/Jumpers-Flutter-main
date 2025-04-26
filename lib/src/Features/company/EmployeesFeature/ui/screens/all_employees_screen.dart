part of 'IMPORTS_employees_screen.dart';

/// Replace [JobEmployeesController] with [MyEmployeesController]
class AllEmployeesScreen extends StatelessWidget {
  const AllEmployeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyEmployeesController>(builder: (_) {
      return AndroidOnRefresh(
        onRefresh: () async {
          await _.getMyEmployees();
        },
        child: ListView(
          children: [
            DataStatusBuilder(
              status: _.dataState,
              onDoneBuild: _.dataState is DataSuccess
                  ? ConditionalBuilder(
                      condition: _.dataState.data!.isNotEmpty,

                      /// list is empty => EmptyEmployeesScreen
                      onBuild: AllEmployeeCardBuilder(
                          employees: _.dataState.data ?? []),
                      onFeedBack: Padding(
                        padding: EdgeInsets.only(top: 150.0.h),
                        child: const EmptyAllEmployeeBuilder(),
                      ),

                      /// replace
                    )
                  : 0.0.ESH(),
              onLoadingBuild: const LoadingBox(heightRatio: 0.7),
            )
          ],
        ),
      );
    });
  }
}
