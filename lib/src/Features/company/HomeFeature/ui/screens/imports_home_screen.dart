import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/company/HomeFeature/bloc/controller/company_home_controller.dart';
import 'package:jumper/src/Features/company/HomeFeature/ui/widgets/imports_widgets_home_screen.dart';
import 'package:jumper/src/Features/company/jobs/bloc/controller/fetch_myjobs_controller.dart';
import 'package:jumper/src/Ui/adaptive/adaptive_onrefresh.dart';
import 'package:jumper/src/Ui/listview/custom_listview.dart';
import 'package:jumper/src/Ui/loading/loading_box.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../../../../../Core/resources/data_state.dart';
import '../../../jobs/ui/widgets/imports_widgets_job_screen.dart';

part 'company_home_screen.dart';
