import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/MapFeature/bloc/controller/map_controller.dart';
import 'package:jumper/src/Features/company/MapFeature/ui/widgets/imports_widgets_map_screen.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';
import 'package:jumper/src/Ui/scaffold/default_scaffold.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';

part 'map_screen.dart';
