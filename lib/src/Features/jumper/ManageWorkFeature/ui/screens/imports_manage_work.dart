import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Features/jumper/JobsFeature/ui/widgets/imports_widgets_jumper_jobs.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';
import 'package:jumper/src/Features/jumper/ManageWorkFeature/bloc/controller/manage_work_controller.dart';
import 'package:jumper/src/Features/jumper/ManageWorkFeature/ui/widgets/imports_widgets_manage_work.dart';
import 'package:jumper/src/Ui/adaptive/adaptive_onrefresh.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/listview/custom_listview.dart';
import 'package:jumper/src/Ui/loading/loading_box.dart';

part 'manage_work_screen.dart';
