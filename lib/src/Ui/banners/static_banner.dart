import 'package:flutter/material.dart';

import '../text/custom_text.dart';

class StaticBanner extends StatelessWidget {
  final String title;

  final String imageUrl;

  const StaticBanner({
    Key? key,
    this.title = "",
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(imageUrl),
            ),
          ),
          child: CustomText(
            title,
            color: Colors.white,
            fontSize: 12,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
          ),
        ),
      ),
    );
  }
}
