import 'package:flutter/material.dart';

import '../text/custom_text.dart';

class InlineListTile extends StatelessWidget {
  final String label;
  final String data;

  const InlineListTile({Key? key, required this.label, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CustomText.subtitle(
            label,
            fontSize: 16,
          ),
          const Spacer(),
          CustomText(
            data,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
