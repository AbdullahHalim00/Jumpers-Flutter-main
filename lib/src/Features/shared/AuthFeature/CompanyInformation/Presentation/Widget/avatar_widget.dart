import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/services/image_network.dart';
import 'package:jumper/src/Core/services/photo_view.dart';
import 'package:jumper/src/Core/utils/extensions.dart';

class AvatarWidget extends StatefulWidget {
  final Function(File) onTap;
  String futureImage;
  String defaultImage;
  final bool isUpload;

  AvatarWidget({
    Key? key,
    required this.defaultImage,
    required this.onTap,
    this.futureImage = "",
    this.isUpload = true,
  }) : super(key: key);

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  File? image;
  String? img64;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
      // final bytes = File(image.path).readAsBytesSync();
      // img64 = base64Encode(bytes);
      widget.onTap(this.image!);
    } on PlatformException catch (e) {
      debugPrint("field picked image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(555.r),
          child: Container(
            color: AppColors.greyOverlay,
            height: 122.w,
            width: 122.w,
            child: widget.futureImage == null || widget.futureImage == ""
                ? image != null
                    ? Image.file(
                        image!,
                        fit: BoxFit.cover,
                        height: 80.w,
                        width: 80.w,
                      )
                    : ImageIcon(
                        AssetImage(widget.defaultImage),
                        color: Colors.white,
                      )
                : GestureDetector(
                    onTap: () {
                      Get.to(() => PhotoViewWidget(
                            imageProvider: NetworkImage(widget.futureImage),
                          ));
                    },
                    child: ImageNetwork(
                      url: widget.futureImage,
                      height: 122.w,
                      width: 122.w,
                    ),
                  ),
          ),
        ),
        widget.isUpload
            ? Positioned(
                bottom: 0,
                left: 6.w,
                child: InkWell(
                  onTap: () {
                    if (image != null || widget.futureImage != "") {
                      setState(() {
                        image = null;
                        img64 = null;
                        widget.futureImage = "";
                        // _deleteFile();
                      });
                    } else {
                      getImage();
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
                            color: AppColors.secondary,
                            child: Center(
                              child: ImageIcon(
                                image != null || widget.futureImage != ""
                                    ? const AssetImage(
                                        'assets/icons/edit_2.png')
                                    : const AssetImage('assets/icons/add.png'),
                                size: image != null || widget.futureImage != ""
                                    ? 14
                                    : 24.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : 0.ESH(),
      ],
    );
  }
}
