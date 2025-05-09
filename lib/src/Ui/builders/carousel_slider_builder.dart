import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

typedef CarouselBuilder<T> = Widget Function(BuildContext context, T element);

/* example for usage :
  CarouselSliderBuilder<BikesData>(
  list: bikes,
  builder: (context, e) => Card(title : e.title),
*/
class CarouselSliderBuilder<T> extends StatelessWidget {
  final List<T> list;
  final double? height;

  final CarouselBuilder<T> builder;
  final ValueChanged<double?>? onScrolled;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  const CarouselSliderBuilder({
    required this.list,
    required this.builder,
    this.height,
    Key? key,
    this.onPageChanged,
    this.onScrolled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: list.map((e) {
        return builder(context, e);
      }).toList(),
      options: CarouselOptions(
        height: height ?? MediaQuery.of(context).size.height * 0.4,
        autoPlay: true,
        onScrolled: onScrolled,
        onPageChanged: onPageChanged,
        enableInfiniteScroll: false,
        reverse: false,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.easeInOutCubic,
        viewportFraction: 0.7,
        scrollPhysics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
      ),
    );
  }
}
