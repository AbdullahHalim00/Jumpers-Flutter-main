import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';

/// add ios here
class AndroidOnRefresh extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Widget child;

  const AndroidOnRefresh({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primary,
      displacement: 60.h,
      strokeWidth: 3.0,
      backgroundColor: AppColors.white,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: child,
    );
  }
}
// typedef BuildOnRefreshItem<T> = Widget Function(BuildContext context,T item);
//
// class AdaptiveOnRefreshListView<T> extends StatelessWidget {
//   final RefreshCallback onRefresh;
//   final Widget? child;
//   final List <T> data;
//   final BuildOnRefreshItem buildOnRefreshItem ;
//
//   const AdaptiveOnRefreshListView({
//     Key? key,
//     required this.onRefresh,
//       this.child,
//     required this.data,
//
//     required this.buildOnRefreshItem,
//
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS
//         ? _BuildIOSList(
//             onRefresh: onRefresh,
//             data: data,
//             child: child,
//       buildItem: buildOnRefreshItem,
//           )
//         : _BuildAndroidList(
//             onRefresh: onRefresh,
//             child: child,
//             data: data,
//       buildItem: buildOnRefreshItem,
//           );
//   }
// }
//
// class _BuildIOSList<T> extends StatelessWidget {
//   final RefreshCallback onRefresh;
//   final List <T> data;
//     final BuildOnRefreshItem buildItem;
//   final Widget ? child;
//
//
//
//   const _BuildIOSList({
//     Key? key,
//     required this.onRefresh,
//       this.child,
//     required this.data,
//     required this.buildItem,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: CustomScrollView(
//         slivers: [
//           CupertinoSliverRefreshControl(
//             onRefresh: onRefresh,
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                     (context, index) {
//               T item = data[index];
//
//               return buildItem(context, index);
//             },
//
//                 childCount: data.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _BuildAndroidList<T> extends StatelessWidget {
//   final RefreshCallback onRefresh;
//   final BuildOnRefreshItem buildItem;
//   final List <T> data;
//   final Widget ? child ;
//
//   const _BuildAndroidList({
//     Key? key,
//     required this.onRefresh,
//     required this.buildItem,
//     required this.data, this.child,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: onRefresh,
//       child: ListView.builder(
//         padding: const EdgeInsets.all(20.0),
//         itemBuilder: (context, index) {
//           final T item = data[index];
//           return buildItem(context, item);
//         },
//         itemCount: data.length,
//       ),
//     );
//   }
// }
//
//
