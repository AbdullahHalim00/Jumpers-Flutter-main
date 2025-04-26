import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Bloc/models/jumper_job_model.dart';
import '../../../../Ui/loading/loading_box.dart';
import '../../JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';
import 'job_activity_screen.dart';
import 'job_info_screen.dart';

class JumperJobDetailsScreen extends StatefulWidget {
  JumperJob? dataJumber;

  JumperJobDetailsScreen({Key? key, this.dataJumber}) : super(key: key);

  @override
  State<JumperJobDetailsScreen> createState() => _JumperJobDetailsScreenState();
}

class _JumperJobDetailsScreenState extends State<JumperJobDetailsScreen>
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
    JumperJobsController _jumperJobsController = Get.find();
    _jumperJobsController.jobDetailsResponse = null;
    _jumperJobsController.getJobDetails(widget.dataJumber!.id.toString());

    _jumperJobsController.jobActivityResponse = null;
    _jumperJobsController.getJobActivity(widget.dataJumber!.id.toString());

    return GetBuilder<JumperJobsController>(builder: (con) {
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
            body: _jumperJobsController.jobDetailsResponse == null
                ? LoadingBox()
                : Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: _jumperJobsController
                                          .jobDetailsResponse!
                                          .data!
                                          .companyImage ??
                                      "",
                                  width: 65,
                                  height: 65,
                                  fit: BoxFit.cover,
                                  color: Colors.green,
                                  errorWidget: (con, x, _) => Icon(Icons.error),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${_jumperJobsController.jobDetailsResponse!.data!.companyName}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color:
                                                  Colors.grey.withOpacity(.1)),
                                          child: Text(
                                            '${_jumperJobsController.jobDetailsResponse!.data!.publishedAt}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '${_jumperJobsController.jobDetailsResponse!.data!.serviceTitle}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
                              JobInfoScreen(),
                              JobActivityScreen(id: widget.dataJumber!.id),
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
