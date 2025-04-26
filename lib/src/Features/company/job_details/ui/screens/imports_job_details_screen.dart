import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/company_job_model.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/accept_employee_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/job_details_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/job_employees_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/refuse_employee_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/request_more_for_job_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/return_employee_controller.dart';
import 'package:jumper/src/Features/company/job_details/ui/widgets/imports_widgets_job_details_screen.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/buttons/custom_outlined_button.dart';
import 'package:jumper/src/Ui/cards/job_application_card.dart';

import '../../../../shared/ChatsFeature/bloc/controller/chats_controller.dart';
import '../widgets/pay_dialog.dart';

part 'accepted_canditates_screen.dart';
part 'all_candidates_screen.dart';
part 'job_details_screen.dart';
part 'rejected_candidates_screen.dart';
