import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/utils/date_utilities.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/shared/ChatDetailsFeature/ui/screens/imports_chat_details.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/model/chat.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/containers/default_container.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/custom_divider.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

part 'build_chats_body.dart';
part 'chat_card.dart';
