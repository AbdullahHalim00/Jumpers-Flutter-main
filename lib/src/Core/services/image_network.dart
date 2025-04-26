import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Ui/loading/loading.dart';

class ImageNetwork extends StatelessWidget {
  final String? url;
  final double? width, height;
  final String? defaultAvatar;
  final BoxFit boxFit;

  const ImageNetwork({
    Key? key,
    this.boxFit = BoxFit.cover,
    required this.url,
    this.width,
    this.height,
    this.defaultAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: (height)!.h,
      width: (width!).w,
      imageUrl: url!,
      fit: boxFit,
      placeholder: (context, url) => Loading.discreteCircle(),
      errorWidget: (context, url, error) => Center(
        child: Image.asset(
          defaultAvatar ?? Assets.something_wrong,
        ),
      ),
    );
  }
}
