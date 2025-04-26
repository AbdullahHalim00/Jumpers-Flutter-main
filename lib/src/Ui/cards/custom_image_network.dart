import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageNetwork extends StatelessWidget {
  String? image;
  double? radius;
  double? height;
  double? width;
  BoxFit? fit;

  CustomImageNetwork(
      {required this.image,
      required this.height,
      required this.radius,
      required this.width,
      required this.fit});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CachedNetworkImage(
      imageUrl: image ?? "",
      height: height!.r,
      width: width!.r,
      fit: fit!,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height!.r,
          width: width!.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height!.r,
        width: width!.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[300],
        ),
        child: Icon(
          Icons.image_not_supported,
          size: 30.r,
          color: Colors.black,
        ),
      ),
    );
  }
}
