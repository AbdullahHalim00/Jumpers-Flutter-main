import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  String? title;
  Icon? icon;
  String? data;

  InfoWidget({this.title, this.icon, this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.grey.withOpacity(.1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
          ),
          Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: icon!),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 90, child: Text(title!)),
              Text(
                data ?? "",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
