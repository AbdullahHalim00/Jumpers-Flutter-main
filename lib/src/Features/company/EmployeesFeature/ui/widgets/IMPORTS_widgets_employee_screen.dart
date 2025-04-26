import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/employee_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/controller/my_employees_controller.dart';
import 'package:jumper/src/Ui/animation/animated_wrapper.dart';
import 'package:jumper/src/Ui/builders/empty_page_builder.dart';
import 'package:jumper/src/Ui/cards/employee_card.dart';
import 'package:jumper/src/Ui/listview/custom_listview.dart';
import 'package:jumper/src/Ui/radio/custom_radio_tile.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';

part 'BuildEmployeeByOrderSheet.dart';
part 'all_employee_card_builder.dart';
part 'empty_all_employees_builder.dart';
part 'empty_fav_employees_builder.dart';
part 'favourite_employee_card_builder.dart';
