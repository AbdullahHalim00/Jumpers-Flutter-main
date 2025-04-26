import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Features/company/jobs/bloc/controller/company_activity_emplyee_controller.dart';

import '../../../../../Bloc/models/company_job_model.dart';
import '../../../../../Ui/loading/loading_box.dart';
import 'company_job_activity_screen.dart';
import 'company_job_info_screen.dart';

class CompanyJobDetailsScreen extends StatefulWidget {
  int? job_id;
  int? employee_id;
  final CompanyJobModel? job;

  CompanyJobDetailsScreen({Key? key, this.employee_id, this.job_id, this.job})
      : super(key: key);

  @override
  State<CompanyJobDetailsScreen> createState() =>
      _JumperJobDetailsScreenState();
}

class _JumperJobDetailsScreenState extends State<CompanyJobDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  initTabController() {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    initTabController();
  }

  @override
  Widget build(BuildContext context) {
    CompanyActivityEmployeeController companyActivityEmployeeController =
        Get.put(CompanyActivityEmployeeController());
    companyActivityEmployeeController.employeeActivityResponse = null;
    companyActivityEmployeeController.getJobActivity(
        widget.job_id.toString(), widget.employee_id.toString());
    return GetBuilder<CompanyActivityEmployeeController>(builder: (con) {
      return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: .61,
              title: Text(
                "job_details".tr,
                style: TextStyle(
                    fontFamily: 'Somar',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            body: con.employeeActivityResponse == null
                ? LoadingBox()
                : Container(
                    child: Column(
                      children: [
                        TabBar(
                          controller: tabController,
                          indicatorWeight: 2.1,
                          indicatorColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          tabs: [
                            Tab(
                              child: Container(
                                child: Text(
                                  "job_info".tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                child: Text(
                                  "activities_record".tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              CompanyJobInfoScreen(job: widget.job),
                              CompanyJobActivityScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ));
    });
  }
}
