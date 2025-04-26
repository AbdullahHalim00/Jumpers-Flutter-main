import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/// Depends on flutter_rating_bar package

class RatingBarWidget extends StatelessWidget {
  final double initialRating;
  final EdgeInsets? itemPadding;
  final bool isDisabled;

  final ValueChanged<double> onRatingUpdate;

  const RatingBarWidget({
    Key? key,
    required this.onRatingUpdate,
    this.initialRating = 4,
    this.itemPadding,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isDisabled,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: RatingBar.builder(
            initialRating: initialRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding:
                itemPadding ?? const EdgeInsets.symmetric(horizontal: 10.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: onRatingUpdate,
            // cubit.rateProduct(rating),
          ),
        ),
      ),
    );
  }
}
