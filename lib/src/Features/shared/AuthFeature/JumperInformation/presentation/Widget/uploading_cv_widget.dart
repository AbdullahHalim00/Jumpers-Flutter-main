import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Logic/jumpe_employment_info_controller.dart';
import 'package:jumper/src/Ui/builders/shapes_builder.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class UploadingCVWidget extends StatefulWidget {
  final Function(File) onTap;
  final VoidCallback? onRemoveCV;
  String futureImage;
  final bool isUpload;

  UploadingCVWidget({
    Key? key,
    required this.onTap,
    this.futureImage = "",
    this.isUpload = true,
    this.onRemoveCV,
  }) : super(key: key);

  @override
  State<UploadingCVWidget> createState() => _UploadingCVWidgetState();
}

class _UploadingCVWidgetState extends State<UploadingCVWidget> {
  File? cv;
  String? img64;
  PlatformFile? _file;

  Future _getImage() async {
    try {
      FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
      printDM("enter 1");
      if (resultFile != null) {
        printDM("enter 2");

        setState(() => cv = File(resultFile.files.single.path!));
        printDM("enter 3");
        _file = resultFile.files.first;

        widget.onTap(cv!);
        printDM("enter 4");
        printDM("enter cv $cv");
      } else {
        printDM("enter 5");
        // User canceled the picker
      }
    } on PlatformException catch (e) {
      printDM("enter 6");

      debugPrint("field picked image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    printDM('widget.futureImage is ${widget.futureImage}');
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: ShapeBuilder.dashSquare(
        color: AppColors.primary,
        strokeWidth: 2,
        child: Stack(
          children: [
            Container(
              height: 152.h,
              width: double.infinity,
              color: AppColors.primary.withOpacity(0.05),
              child: widget.futureImage == null || widget.futureImage == ""
                  ? cv != null
                      ? ((_file!.extension == "pdf" && _file != null) ||
                              (widget.futureImage != ''))
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  child: const ImageIcon(
                                    AssetImage(
                                        'assets/icons/uploadeCVIcon.png'),
                                    color: AppColors.primary,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 24.r,
                                ),
                                10.ESH(),
                                const CustomText(
                                  'success_uploade_c_v',
                                  fontSize: 12,
                                ),
                                10.ESH(),
                                CustomText.light(
                                  '',
                                  color: AppColors.primary,
                                ),
                              ],
                            )
                          : Image.file(
                              cv!,
                              fit: BoxFit.cover,
                              height: 80.w,
                              width: 80.w,
                            )
                      : InkWell(
                          onTap: () {
                            _getImage();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: const ImageIcon(
                                  AssetImage('assets/icons/uploadeCVIcon.png'),
                                  color: AppColors.primary,
                                ),
                                backgroundColor: Colors.white,
                                radius: 24.r,
                              ),
                              10.ESH(),
                              const CustomText(
                                'uploade_c_v',
                                fontSize: 12,
                              ),
                              10.ESH(),
                              CustomText.light(
                                'uploade_as_PDF_PNG',
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        )
                  : GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "cv_uploaded",
                              fontSize: 14,
                              color: AppColors.primary,
                            ),
                            YSpace.light,
                            CustomText(
                              widget.futureImage
                                  .split(
                                      "https://jumpers.crazyideaco.com/uploads/")
                                  .join(""),
                              fontSize: 14,
                            ),
                            // if(cv != null || widget.futureImage != "") ...[
                            //   10.ESH(),
                            //   Align(
                            //     alignment: Alignment.bottomLeft,
                            //     child: GestureDetector(
                            //       onTap: widget.onRemoveCV,
                            //       child: Row(
                            //         mainAxisSize: MainAxisSize.min,
                            //         children: [
                            //           Padding(
                            //             padding: const EdgeInsetsDirectional.only(
                            //               start: 10.0,
                            //             ),
                            //             child: CircleAvatar(
                            //               backgroundColor: AppColors.red,
                            //               radius: 17.r,
                            //               child: Icon(
                            //                 Icons.delete,
                            //                 size: 20.r,
                            //                 color: AppColors.white,
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ],
                          ],
                        ),
                      ),
                      // child: ImageNetwork(
                      //   url: widget.futureImage,
                      //   height: 122.w,
                      //   width: 122.w,
                      // ),
                    ),
            ),
            (cv != null || widget.futureImage != "")
                ? Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: GetBuilder<JumperEmploymentInfoController>(
                        builder: (logic) {
                      return InkWell(
                        onTap: () {
                          if (cv != null || widget.futureImage != "") {
                            setState(() {
                              cv = null;
                              img64 = null;
                              widget.futureImage = "";
                              // _deleteFile();
                            });
                            logic.deleteCv();
                          } else {
                            _getImage();
                          }
                        },
                        borderRadius: BorderRadius.circular(555),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(555.r),
                          child: Container(
                            height: 30.w,
                            width: 30.w,
                            color: Colors.white,
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(555.r),
                                child: Container(
                                  height: 26.w,
                                  width: 26.w,
                                  // color: AppColors.secondary,
                                  child: Center(
                                    child: ImageIcon(
                                      cv != null || widget.futureImage != ""
                                          ? const AssetImage(
                                              'assets/icons/close.png')
                                          : const AssetImage(
                                              'assets/icons/add.png'),
                                      size:
                                          cv != null || widget.futureImage != ""
                                              ? 14
                                              : 24.w,
                                      color: AppColors.greyDarker,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                : 0.ESH(),
          ],
        ),
      ),
    );
  }
}
