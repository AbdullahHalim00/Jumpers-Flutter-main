import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Bloc/models/candidate_model.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/constants/decorations/app_shapes.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/services/Downloader/DownloaderService.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/animation/animated_wrapper.dart';
import 'package:jumper/src/Ui/builders/candidate_details_builder.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/buttons/download_pdf_button.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

part 'candidate_details_header.dart';
part 'sneaky_candidate_dialog.dart';
