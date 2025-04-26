import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/controller/my_employees_controller.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/controller/my_fav_employees_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/job_employees_controller.dart';
import 'package:jumper/src/Ui/adaptive/adaptive_onrefresh.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/listview/custom_listview.dart';
import 'package:jumper/src/Ui/loading/loading_box.dart';
import 'package:jumper/src/Ui/scaffold/default_scaffold.dart';
import 'package:jumper/src/core/utils/extensions.dart';

import '../../../../../Core/constants/colors/app_colors.dart';
import '../widgets/IMPORTS_widgets_employee_screen.dart';

part 'all_employees_screen.dart';
part 'employees_screen.dart';
part 'favourite_employees_screen.dart';
