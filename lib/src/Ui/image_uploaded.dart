import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';

class ImageUploaded extends StatelessWidget {
  final dynamic fileImage;
  final String? image;
  final VoidCallback? onDelete;

  const ImageUploaded({
    Key? key,
    required this.fileImage,
    this.image,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    printDM(
        "image as File $fileImage  ++++++++++++++++++++++ image as Url $image");
    return ConditionalBuilder(
      condition: '1' != '0',
      onBuild: InkWell(
        onLongPress: () {
          // Utils.showPreviewDialog(
          //   closeAfterAWhile: true,
          //   child: Center(
          //     child: Container(
          //       height: 150,
          //       width: 150,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20.0),
          //           color: Colors.black12,
          //           image: (fileImage != null && fileImage is File)
          //               ? DecorationImage(
          //               image: FileImage(fileImage), fit: BoxFit.cover)
          //               : DecorationImage(
          //               image: NetworkImage(image ?? Assets.account_disabled),
          //               fit: BoxFit.cover)),
          //     ),
          //   ),
          // );
        },

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.black12,
              image: (fileImage != null && fileImage is File)
                  ? DecorationImage(
                      image: FileImage(fileImage), fit: BoxFit.cover)
                  : DecorationImage(
                      // image: NetworkImage(image ?? Assets.account_disabled),
                      image: NetworkImage(fileImage ?? Assets.account_disabled),
                      fit: BoxFit.cover,
                    ),
            ),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                CloseButton(
                  color: Colors.white,
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ),
      ),
      onFeedBack: const SizedBox.shrink(),
    );
  }
}
