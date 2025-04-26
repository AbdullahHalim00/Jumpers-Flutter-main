part of 'IMPORTS_widgets_employee_screen.dart';

class BuildEmployeeByOrderSheet extends StatelessWidget {
  const BuildEmployeeByOrderSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SheetHeader(
      title: "order_by".tr,
      sheetBody: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StatefulBuilder(
          builder: (context, setState) {
            return CustomListView(
              children: _OrderSheetModel.list
                  .map(
                    (e) => CustomRadioTile(
                      label: e.label,
                      isSelected: e.isSelected,
                      onTap: () {
                        setState(() {
                          for (var element in _OrderSheetModel.list) {
                            element.isSelected = false;
                          }
                          e.isSelected = true;
                          Get.back();
                        });
                      },
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}

class _OrderSheetModel {
  final String label;

  bool isSelected;

  _OrderSheetModel({required this.label, this.isSelected = false});

  static List<_OrderSheetModel> list = [
    _OrderSheetModel(
      label: "order_by_old_to_new".tr,
    ),
    _OrderSheetModel(
      label: "order_by_new_to_old".tr,
    ),
    _OrderSheetModel(
      label: "order_by_completed_only".tr,
    ),
    _OrderSheetModel(
      label: "order_by_current_only".tr,
    ),
  ];
}
